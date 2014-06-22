class ProductReview < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :product, :user, presence: true
  validates :product, :user, uniqueness: true
  validates :rating, inclusion: { in: 1..5 }
end
