class ProductReview < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :product, uniqueness: { scope: :user }, presence: true
  validates :user, uniqueness: { scope: :product }, presence: true
  validates :rating, inclusion: { in: 1..5 }
end
