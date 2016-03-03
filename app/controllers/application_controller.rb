class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :is_logged_in?, :current_cart

  def is_logged_in?
    !!session[:user_id]
  end

  def current_user
     @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_cart
     @current_cart ||=Cart.find(session[:cart_id]) if session[:cart_id]&&session[:user_id]
  end

end
