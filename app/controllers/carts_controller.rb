class CartsController < ApplicationController
  helper_method :current_cart

  def add_to_cart
  end

  def show
  end

  def current_cart
    current_user.current_cart
  end
end
