class BoardsController < ApplicationController
  before_action :set_target_board, only: %i[show edit update destroy]
  before_action :logged_in_user
  before_action :ensure_correct_user, only: %i[edit update destroy]

  def index
    @boards = params[:category_id].present? ? Category.find(params[:category_id]).boards.order('id DESC') : Board.order('id DESC')
    @boards = @boards.page(params[:page])
  end

  def new
    if flash[:board]
      @board = Board.new(flash[:board])
    else  
      @board = Board.new(user_id: @current_user.id)
    end
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      flash[:notice] = "「#{@board.title}」の掲示板を作成しました"
      redirect_to @board
    else  
      flash[:board] = @board 
      flash[:error_messages] = @board.errors.full_messages
      redirect_back fallback_location: new_board_path 
    end
  end

  def show
    @comment = Comment.new(board_id: @board.id)
    @liking_users = @board.liking_users.limit(10)
  end

  def edit
  end

  def update 
    if @board.update(board_params)
      flash[:notice] = "「#{@board.title}」の掲示板を編集しました"
      redirect_to @board 
    else
      flash[:error_messages] = @board.errors.full_messages
      redirect_back fallback_location: edit_board_path
    end
  end

  def destroy 
    @board.destroy
    flash[:notice] = "「#{@board.title}」の掲示板が削除されました"
    redirect_to current_user
  end

  private

    def board_params
      params.require(:board).permit(:user_id, :title, :body, category_ids: [])
    end

    def set_target_board
      @board = Board.find(params[:id])
    end

    def ensure_correct_user
      @board = Board.find_by(id: params[:id])
      if @board.user_id != @current_user.id
        flash[:notice] = "権限がありません"
        redirect_to @board
      end 
    end
end
