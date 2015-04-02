module ApplicationHelper
  def proxy_image(image_url)
    force_proxy_hosts = [ "rsc.aurora-pro.com" ]
    if URI(image_url).host.in?(force_proxy_hosts) || use_image_proxy?
      image_url.gsub!(/^http:\/\//, 'http://proxy.libredmm.com/')
    end
    image_url
  end

  def use_image_proxy?
    cookies[:use_image_proxy]
  end
end
