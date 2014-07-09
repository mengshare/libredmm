class Product < ActiveRecord::Base
  has_many :reviews, class_name: 'ProductReview'
  has_many :reviewed_users, through: :reviews, source: :user

  validates :code, :title, :thumbnail_image, :cover_image, presence: true
  validates :code, uniqueness: true

  paginates_per 30

  def self.cache_key
    count          = self.count
    max_updated_at = self.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "products/all-#{count}-#{max_updated_at}"
  end

  def self.search(query)
    product = search_in_db(query)
    return product if product
    details = OpenDMM.search(query)
    return nil unless details
    product = Product.find_by_code(details[:code]) ||
              Product.new(details)
    product.register_alias(details[:code], query) ? product : nil
  end

  def self.search_in_db(query)
    return self.where("? = ANY (aliases)", query.upcase).take
  end

  def average_rating
    reviews.average(:rating)
  end

  def rating_by(user)
    return nil unless user
    reviews.detect do |review|
      review.user_id == user.id
    end.try(:rating)
  end

  def refresh!
    return false if updated_at >= 10.minute.ago
    @details = OpenDMM.search(code)
    return false unless @details
    self.attributes = @details
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
    save
  end

  def to_param
    code
  end
end
