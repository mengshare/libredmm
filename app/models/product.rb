class Product < ActiveRecord::Base
  #=============
  # Validations
  #=============
  validates :code, :title, :cover_image, presence: true
  validates :code, uniqueness: true

  #========
  # Search
  #========
  def self.search(query)
    find_by_code(query) || search_using_opendmm(query)
  end

  def self.search_using_opendmm(query)
    details = OpenDMM.search(query)
    return nil unless details
    product = find_by_code(details[:code]) || create(details)
    product.save ? product : nil
  end

  #=======
  # Other
  #=======
  def thumbnail_image
    super || self.cover_image
  end

  def refresh!
    return false if updated_at >= 10.minute.ago
    details = OpenDMM.search(code)
    return false unless details
    self.attributes = details
    return false unless changed?
    save
  end

  def to_param
    code
  end
end
