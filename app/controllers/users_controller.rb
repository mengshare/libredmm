class UsersController < ApplicationController
  def toggle_proxy
    if cookies[:use_image_proxy]
      cookies.delete :use_image_proxy
    else
      cookies.permanent[:use_image_proxy] = true
    end
    redirect_to :back
  end
end
