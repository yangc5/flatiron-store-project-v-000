class User < ActiveRecord::Base
  has_secure_password

  has_many :carts

  def current_cart
    if @current_cart.nil?
      @current_cart = Cart.create(user_id: self.id)
    end
    return @current_cart
  end

  def current_cart=(cart)
    @current_cart = cart
  end

end
