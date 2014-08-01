class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :destroy]

  def index
    @products = Product.all

    if params[:reviewed]
      authenticate_user!
      @products = Product.reviewed_by(current_user)
    end

    @products = @products.with_actress(params[:actress])
                         .with_code(params[:code])
                         .with_genre(params[:genre])
                         .with_maker(params[:maker])
                         .with_title(params[:title])

    @products = params[:latest] ? @products.order(created_at: :desc)
                                : @products.order(code: :asc)

    @products = @products.page(params[:page]).per(30)
  end

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
      logger.tagged 'NOT_FOUND' do logger.warn params[:id] end
    end
end
