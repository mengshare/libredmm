module UsersHelper
  def use_image_proxy?
    cookies[:use_image_proxy]
  end
end
