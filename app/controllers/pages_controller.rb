class PagesController < ApplicationController
  def search
    if params[:code].empty?
      redirect_to root_url
    else
      redirect_to product_path(params[:code])
    end
  end
end
