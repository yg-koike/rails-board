class HomeController < ApplicationController
  def index
    @boards = Board.order('id DESC').limit(5)
    @popular_boards = Board.order('likes_count DESC').limit(5)
  end
end
