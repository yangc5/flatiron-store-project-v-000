class CartsController < ApplicationController

  def add_to_cart
    current_cart.add_item(params[:item_id])
    redirect_to cart_path(current_cart)
  end

  def checkout
  end

  def show
    @cart = current_user.current_cart
  end

end
