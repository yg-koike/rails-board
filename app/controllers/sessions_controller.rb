class SessionsController < ApplicationController
  before_action :log_out_user, only: %i[new create]
  before_action :logged_in_user, only: %i[destroy]

  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash[:danger] = 'ユーザー名またはパスワードが違います' 
      redirect_back fallback_location: login_path
    end
  end

  def destroy
    log_out 
    redirect_to root_path
  end
end
