class PagesController < ApplicationController
  def search
    if params[:q].blank?
      redirect_to root_url
      return
    end
    @product = Product.search(params[:q])
    if @product
      redirect_to @product
      return
    end
    @products = Product.where("code LIKE ?", "%#{params[:q]}%")
    if @products.exists?
      params[:code] = params[:q]
    else
      @products = Product.where("? = ANY (actresses)", params[:q])
      if @products.exists?
        params[:actress] = params[:q]
      else
        @products = Product.where("title LIKE ?", "%#{params[:q].split.join('%')}%") unless @products.exists?
        if @products.exists?
          params[:title] = params[:q]
        end
      end
    end
    if @products.exists?
      @products = @products.page(params[:page])
      render 'products/index'
      return
    end
    render 'products/notfound'
  end
end
