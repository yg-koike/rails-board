class LikesController < ApplicationController
  before_action :set_variables

  def like 
    like = @current_user.likes.new(board_id: @board.id)
    like.save 
  end

  def unlike
    like = @current_user.likes.find_by(board_id: @board.id)
    like.destroy 
  end

  private

  def set_variables
    @board = Board.find(params[:board_id])
    @id_name = "#like-link-#{@board.id}"
  end
end
