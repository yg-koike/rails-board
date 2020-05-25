class CategoriesController < ApplicationController
  before_action :logged_in_user
  
  def index
    @categories = Category.all 
  end
  
  def new
    @category = Category.new(flash[:category])  
  end

  def create
    @category = Category.new(category_params)
    if @category.save 
      redirect_to boards_path
    else
      flash[:category] = @category 
      flash[:error_messages] = @category.errors.full_messages
      redirect_back fallback_location: new_category_path
    end
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    flash[:notice] = "#{category.name}カテゴリーが削除されました"
    redirect_to categories_path
  end

  private

    def category_params 
      params.require(:category).permit(:name)
    end
end
