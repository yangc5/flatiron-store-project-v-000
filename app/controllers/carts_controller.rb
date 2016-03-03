class CartsController < ApplicationController

  def add_to_cart
    if current_cart.nil?
      session[:cart_id]=current_user.current_cart.id
    end
    current_cart.add_item(params[:item_id])
    redirect_to cart_path(current_cart)
  end

  def show
  end

  def checkout
    @cart = current_cart
    @cart.line_items.each do |line_item|
      item = line_item.item
      item.inventory -= line_item.quantity
      item.save
    end
    unless session[:cart_id].nil?
      session.delete :cart_id
      current_user.current_cart = nil
    end
    redirect_to items_path
  end

end
