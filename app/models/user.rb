class User < ActiveRecord::Base
  has_secure_password

  has_many :carts

  def current_cart
    @current_cart ||= Cart.create(user_id: self.id)
  end

  def current_cart=(cart)
    @current_cart = cart
  end

end
