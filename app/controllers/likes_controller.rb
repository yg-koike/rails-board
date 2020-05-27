class LikesController < ApplicationController
  before_action :set_variables
  before_action :logged_in_user

  def like
    unless current_user.likes.find_by(board_id: @board.id)
      like = current_user.likes.new(board_id: @board.id)
      like.save
    end
  end

  def unlike
    like = current_user.likes.find_by(board_id: @board.id)
    like.destroy 
  end

  private

  def set_variables
    @board = Board.find(params[:board_id])
    @id_name = "#like-link-#{@board.id}"
  end
end
