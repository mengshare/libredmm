class PagesController < ApplicationController
  def search
    query = params[:q]
    if query.blank?
      redirect_to root_url
    elsif product = Product.search(query)
      redirect_to product
    else
      render 'products/not_found'
    end
  end

  def toggle_proxy
    if cookies[:use_image_proxy]
      cookies.delete :use_image_proxy
    else
      cookies.permanent[:use_image_proxy] = true
    end
    redirect_to :back
  end
end
