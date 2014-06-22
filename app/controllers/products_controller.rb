class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :destroy]

  def index
    if params[:reviewed]
      authenticate_user!
      @products = current_user.reviewed_products
    else
      @products = Product.all
    end
  end

  def show
    render :notfound unless @product
    respond_to do |format|
      format.html
      format.json { render json: @product, except: [:id, :created_at, :updated_at] }
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
