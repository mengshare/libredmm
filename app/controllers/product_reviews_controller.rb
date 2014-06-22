class ProductReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    @product = Product.search(params[:product_id])
    review = @product.reviews.find_or_create_by(user: current_user)
    review.rating = params[:rating]
    redirect_to :back, alert: (review.save ? nil : 'Unknown Error')
  end
end
