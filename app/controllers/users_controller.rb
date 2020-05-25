class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[show edit update]
  before_action :set_target_user, only: %i[edit update show]
  before_action :current_user_page, only: %i[edit update]

  def new
    @user = User.new(flash[:user])
  end

  def create
    user = User.new(user_params)
    if user.save 
      log_in user
      redirect_to user
    else
      flash[:user] = user
      flash[:error_messages] = user.errors.full_messages
      redirect_back fallback_location: new_user_path
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "ユーザーを編集しました"
      redirect_to @user 
    else
      flash[:error_messages] = @user.errors.full_messages
      redirect_back fallback_location: edit_user_path
    end
  end

  def show
    @boards = Board.where(user_id: @user.id)
  end

  private

    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation, :user_name)
    end

    def set_target_user
      @user = User.find(params[:id])
    end

    def current_user_page
      unless @user == @current_user
        flash[:notice] = "権限がありません"
        redirect_to @user
      end
    end
end
