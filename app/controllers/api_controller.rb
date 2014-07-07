class ApiController < ApplicationController
  respond_to :json

  def actresses
    respond_with Product.uniq.pluck(:actresses).flatten.sort.uniq
  end

  def codes
    respond_with Product.uniq.pluck(:code).sort
  end

  def makers
    respond_with Product.uniq.pluck(:maker).sort
  end

  def titles
    respond_with Product.uniq.pluck(:title).sort
  end
end
