class Product < ActiveRecord::Base
  has_many :reviews, class_name: 'ProductReview'
  has_many :reviewed_users, through: :reviews, source: :user

  validates :code, :title, :thumbnail_image, :cover_image, presence: true

  def self.search(query)
    product = self.where("? = ANY (aliases)", query).take
    return product if product
    details = OpenDMM.search(query)
    return nil unless details
    product = Product.find_by_code(details[:code]) ||
              Product.new(details)
    product.aliases << query
    product.aliases_will_change!
    product.save ? product : nil
  end

  def to_param
    code
  end

  def refresh!
    return false if updated_at >= 1.hour.ago
    @details = OpenDMM.search(code)
    return false unless @details
    attributes = @details
    return false unless changed?
    save
  end
end
