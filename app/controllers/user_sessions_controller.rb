class UserSessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]
  def new
    @user = User.new
  end

  def create
    if @user = login(params[:email], params[:password])
      flash[:success] = 'Авторизация успешна!'
      redirect_back_or_to(:users)
    else
      flash[:danger] = 'Ошибка авторизации'
      render action: 'new'
    end
  end

  def destroy
    logout
    flash[:info] = 'Сессия завершена!'
    redirect_to(:users)
  end
end
