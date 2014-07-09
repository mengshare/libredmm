class ApiController < ApplicationController
  respond_to :json

  def actresses
    respond_with cache(Product) do
      Product.uniq.pluck(:actresses).flatten.sort.uniq
    end
  end

  def codes
    respond_with cache(Product) do
      Product.uniq.pluck(:code).sort
    end
  end

  def makers
    respond_with cache(Product) do
      Product.uniq.pluck(:maker).sort
    end
  end

  def titles
    respond_with cache(Product) do
      Product.uniq.pluck(:title).sort
    end
  end
end
