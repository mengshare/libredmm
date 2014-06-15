class ProductsController < ApplicationController
  def show
    @product = Product.fuzzy_find(params[:id])
    unless @product
      details = OpenDMM.search(params[:id])
      @product = Product.create!(details) if details
    end
    render :notfound unless @product
  rescue => e
    Admin::Exception.create(uri: request.path, message: e.message, backtrace: e.backtrace)
    render :notfound
  end
end
