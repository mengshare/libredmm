class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :destroy]

  def show
    render :notfound unless @product
    if (user_signed_in?)
      @review = @product.reviews.find_by(user: current_user)
    end
  end

  def destroy
    if @product.refresh!
      redirect_to @product, info: "Product information refreshed, if you still believe it's wrong, click Report Error again. Thanks!"
    else
      redirect_to @product, success: 'Error reported. Thanks!'
    end
  end

  private
    def set_product
      @product = Product.search(params[:id])
    end
end
