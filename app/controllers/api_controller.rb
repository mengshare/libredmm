class ApiController < ApplicationController
  respond_to :json

  def actresses
    @actresses = Product.uniq.pluck(:actresses).flatten.sort.uniq
    respond_with @actresses
  end
end
