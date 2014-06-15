class Admin::ExceptionsController < ApplicationController
  before_action :set_exception, only: :show

  # GET /admin/exceptions
  def index
    @exceptions = Admin::Exception.all
  end

  # GET /admin/exceptions/1
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exception
      @exception = Admin::Exception.find(params[:id])
    end
end
