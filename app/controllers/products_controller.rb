class ProductsController < ApplicationController
  def show
    @product = Product.find_by(code: params[:id])
    unless @product
      details = OpenDMM.search(params[:id])
      @product = Product.create(details) if details
    end
  end
end
