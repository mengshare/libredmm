class LogsController < ApplicationController
  before_action :set_log, only: :show
  before_action :authenticate_user!
  before_action do
    redirect_to root_path, alert: 'Sorry, only admin can visit that page.' unless current_user.admin?
  end

  def index
    @logs = Log.page(params[:page])
  end

  def show
  end

  private
    def set_log
      @log = Log.find(params[:id])
    end
end
