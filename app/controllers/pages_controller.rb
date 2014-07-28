class PagesController < ApplicationController
  def search
    query = params[:q]
    if query.blank?
      redirect_to root_url
    elsif Product.search_in_db(query)
      redirect_to product_path(query)
    elsif Product.with_code(query).exists?
      redirect_to products_path(code: query)
    elsif Product.with_actress(query).exists?
      redirect_to products_path(actress: query)
    elsif Product.with_title(query).exists?
      redirect_to products_path(title: params[:q])
    else
      redirect_to product_path(query)
    end
  end
end
