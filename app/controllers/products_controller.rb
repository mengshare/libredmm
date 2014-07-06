class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :destroy]

  def index
    if params[:min_rating] || params[:max_rating]
      authenticate_user!
      min_rating = params[:min_rating].present? ? params[:min_rating].to_i : 1
      max_rating = params[:max_rating].present? ? params[:max_rating].to_i : 5
      @products = current_user.reviewed_products.includes(:reviews)
                              .where('rating >= ?', min_rating)
                              .where('rating <= ?', max_rating)
    else
      @products = Product.includes(:reviews)
    end

    @products = @products.where(maker: params[:maker]) if params[:maker].present?
    @products = @products.where("? = ANY (actresses)", params[:actress]) if params[:actress].present?
    @products = @products.where("code LIKE ?", "%#{params[:code]}%") if params[:code].present?
    @products = @products.where("title LIKE ?", "%#{params[:title].split.join('%')}%") if params[:title].present?

    if params[:latest]
      @products = @products.order(created_at: :desc)
    else
      @products = @products.order(code: :asc)
    end
    @products = @products.page(params[:page])
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
      Log.error_report(params[:id])
      redirect_to @product, success: "Error reported. Thanks! While we strongly suggest you to read the <a href='/faq'>FAQ</a> in case it's a known issue."
    end
  end

  private
    def set_product
      @product = Product.search(params[:id])
      Log.not_found(params[:id]) unless @product
    end
end
