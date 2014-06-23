class Product < ActiveRecord::Base
  has_many :reviews, class_name: 'ProductReview'
  has_many :reviewed_users, through: :reviews, source: :user

  validates :code, :title, :thumbnail_image, :cover_image, presence: true
  validates :code, uniqueness: true

  default_scope { order(code: :asc) }
  paginates_per 50

  def self.search(query)
    product = self.where("? = ANY (aliases)", query.upcase).take
    return product if product
    details = OpenDMM.search(query)
    return nil unless details
    product = Product.find_by_code(details[:code]) ||
              Product.new(details)
    product.register_alias(details[:code], query) ? product : nil
  end

  def register_alias(*names)
    names.each do |name|
      unless aliases.include? name.upcase
        aliases << name.upcase
        aliases_will_change!
      end
    end
    save
  end

  def to_param
    code
  end

  def refresh!
    return false if updated_at >= 1.minute.ago
    @details = OpenDMM.search(code)
    return false unless @details
    self.attributes = @details
    return false unless changed?
    save
  end
end
