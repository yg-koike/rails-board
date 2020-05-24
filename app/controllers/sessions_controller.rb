class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to mypage_path
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
