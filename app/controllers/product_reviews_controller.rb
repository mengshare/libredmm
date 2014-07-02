class ProductReviewsController < ApplicationController
  before_action :authenticate_user!, :set_product

  def create
    @review = @product.reviews.find_or_create_by(user: current_user)
    @review.rating = params[:rating]
    redirect_to :back, alert: (@review.save ? nil : 'Unknown Error')
  end

  def destroy
    @review = @product.reviews.find_by(user: current_user)
    redirect_to :back, alert: (@review.try(:destroy) ? nil : 'Unknown Error')
  end

  private
    def set_product
      @product = Product.search(params[:product_id])
    end
end
