class ProductsController < ApplicationController
  def show
    @product = Product.find_by(code: params[:id].upcase)
    unless @product
      details = OpenDMM.search(params[:id])
      @product = Product.create(details) if details
    end
    render :notfound unless @product
  rescue
    render :notfound
  end
end
