class Admin::ExceptionsController < ApplicationController
  before_action :set_admin_exception, only: [:show, :edit, :update, :destroy]

  # GET /admin/exceptions
  def index
    @admin_exceptions = Admin::Exception.all
  end

  # GET /admin/exceptions/1
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_exception
      @admin_exception = Admin::Exception.find(params[:id])
    end
end
