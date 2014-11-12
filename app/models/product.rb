class Product < ActiveRecord::Base
  #==============
  # Associations
  #==============
  has_and_belongs_to_many :actresses

  #=============
  # Validations
  #=============
  validates :code, :title, :thumbnail_image, :cover_image, presence: true
  validates :code, uniqueness: true

  #========
  # Scopes
  #========
  scope :with_actress, ->(actress) do
    includes(:actresses).where('actresses.name' => actress) if actress.present?
  end

  scope :with_code, ->(code) do
    where("code LIKE ?", "%#{code}%") if code.present?
  end

  scope :with_genre, ->(genre) do
    where("? = ANY (genres)", genre) if genre.present?
  end

  scope :with_maker, ->(maker) do
    where(maker: maker) if maker.present?
  end

  scope :with_title, ->(title) do
    where("title LIKE ?", "%#{title.split.join('%')}%") if title.present?
  end

  #========
  # Search
  #========
  def self.search(query)
    search_in_db(query) || search_using_opendmm(query)
  end

  def self.search_in_db(query)
    return self.where("? = ANY (aliases)", query.upcase).take
  end

  def self.search_using_opendmm(query)
    details = OpenDMM.search(query)
    return nil unless details
    product = Product.find_by_code(details[:code]) ||
              Product.create_from_opendmm(details)
    return nil unless product
    product.register_alias(details[:code], query)
    product.save ? product : nil
  end

  def self.create_from_opendmm(details)
    actresses = details.delete :actresses
    product = Product.create(details)
    actresses.each do |actress|
      product.actresses << Actress.find_or_create_by(name: actress)
    end if actresses
    product.save ? product : nil
  end

  #=======
  # Other
  #=======
  def self.cache_key
    count          = self.count
    max_updated_at = self.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "products/all-#{count}-#{max_updated_at}"
  end

  def refresh!
    return false if updated_at >= 10.minute.ago
    details = OpenDMM.search(code)
    return false unless details
    actresses = details.delete :actresses
    self.attributes = details
    self.actresses = []
    actresses.each do |actress|
      self.actresses << Actress.find_or_create_by(name: actress)
    end if actresses
    return false unless changed?
    save
  end

  def register_alias(*names)
    names.each do |name|
      unless aliases.include? name.upcase
        aliases << name.upcase
        aliases_will_change!
      end
    end
  end

  def to_param
    code
  end
end
