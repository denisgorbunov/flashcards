class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login

  def not_authenticated
    flash[:info] = 'Сначала авторизуйтесь'
    redirect_to login_path
  end
end
