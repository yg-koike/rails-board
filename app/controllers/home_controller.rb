class HomeController < ApplicationController
  def index
    @boards = Board.order('updated_at DESC').limit(5)
    @popular_boards = Board.order('likes_count DESC').limit(5)
  end
end
