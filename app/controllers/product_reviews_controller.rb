class ProductReviewsController < ApplicationController
  before_action :set_product

  def create
    user = User.first
    review = @product.reviews.find_or_create_by(user: user)
    review.rating = params[:rating]
    redirect_to :back, alert: (review.save ? nil : 'Unknown Error')
  end

  private
    def set_product
      @product = Product.search(params[:product_id])
    end
end
