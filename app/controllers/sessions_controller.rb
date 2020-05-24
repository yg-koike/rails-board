class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id  
      redirect_to mypage_path
    else
      flash[:danger] = 'ユーザー名またはパスワードが違います' 
      redirect_back fallback_location: login_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
