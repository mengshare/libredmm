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
    @product.refresh!
    redirect_to @product
  end

  private
    def set_product
      @product = Product.fuzzy_find(params[:id])
    end
end
