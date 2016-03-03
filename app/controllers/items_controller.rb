class ItemsController < ApplicationController
  def index
    @items = Item.where("inventory > ?", 0)
  end

  def show
    @item = Item.find(params[:id])
  end
end
