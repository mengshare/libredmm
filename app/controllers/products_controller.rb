class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :destroy]

  def show
    render :notfound unless @product
  end

  def destroy
    if @product.updated_at <= 1.hour.ago
      @product.refresh!
      redirect_to @product, info: 'Product information refreshed, if you still think there is any error, click Report Error again. Thanks!'
    else
      redirect_to @product, success: 'Error reported. Thanks!'
    end
  end

  private
    def set_product
      @product = Product.search(params[:id])
    end
end
