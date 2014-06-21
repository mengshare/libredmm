class PagesController < ApplicationController
  def search
    if params[:q].empty?
      redirect_to root_url
    else
      redirect_to product_path(params[:q])
    end
  end
end
