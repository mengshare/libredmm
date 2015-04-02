class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :destroy]

  def show
    if @product
      respond_to do |format|
        format.html
        format.json { render json: @product, except: [:id, :created_at, :updated_at] }
      end
    else
      render :notfound, status: :not_found
    end
  end

  def destroy
    if @product.refresh!
      redirect_to @product, info: "Product information refreshed, if you still believe it's wrong, click Report Error again. Thanks!"
    else
      logger.tagged 'ERROR_REPORT' do logger.error params[:id] end
      redirect_to @product, success: "Error reported. Thanks!"
    end
  end

  private
    def set_product
      @product = Product.search(params[:id])
      logger.tagged 'NOT_FOUND' do logger.warn params[:id] end unless @product
    end
end
