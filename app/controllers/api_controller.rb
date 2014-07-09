class ApiController < ApplicationController
  respond_to :json

  def actresses
    respond_with(cache [Product, :actresses] { Product.uniq.pluck(:actresses).flatten.sort.uniq })
  end

  def codes
    respond_with(cache [Product, :codes] { Product.uniq.pluck(:code).sort })
  end

  def makers
    respond_with(cache [Product, :makers] { Product.uniq.pluck(:maker).sort })
  end

  def titles
    respond_with(cache [Product, :titles] { Product.uniq.pluck(:title).sort })
  end
end
