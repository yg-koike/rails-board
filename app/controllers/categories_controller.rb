class CategoriesController < ApplicationController
  before_action :logged_in_user
  
  def index
    @categories = Category.all 
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_back fallback_location: :back
    else
      flash[:category] = @category
      
      flash[:error_messages] = @category.errors.full_messages
      redirect_back fallback_location: :back
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
