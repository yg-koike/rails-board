class HomeController < ApplicationController
  def index
    @boards = Board.order('id DESC').limit(5)
  end
end
