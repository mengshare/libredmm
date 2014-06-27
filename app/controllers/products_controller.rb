class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :destroy]

  def index
    authenticate_user! if params[:reviewed]
    @products = params[:reviewed] ? current_user.reviewed_products : Product.all
    @products = @products.where(maker: params[:maker]) if params[:maker]
    @products = @products.where("? = ANY (actresses)", params[:actress]) if params[:actress]
    @products = @products.page(params[:page])
  end

  def show
    if @product
      respond_to do |format|
        format.html
        format.json { render json: @product, except: [:id, :created_at, :updated_at] }
      end
    else
      logger.error "[NotFound] #{params[:id]}"
      render :notfound, status: :not_found
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
