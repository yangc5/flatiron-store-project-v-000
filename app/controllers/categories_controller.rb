class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @items = @category.items.where("inventory > ?", 0)
  end
end
