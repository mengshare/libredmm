class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :destroy]

  def show
    unless @product
      details = OpenDMM.search(params[:id])
      @product = Product.create!(details) if details
    end
    render :notfound unless @product
  rescue => e
    Admin::Exception.create(uri: request.path, message: e.message, backtrace: e.backtrace)
    render :notfound
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
      @product = Product.fuzzy_find(params[:id])
    end
end
