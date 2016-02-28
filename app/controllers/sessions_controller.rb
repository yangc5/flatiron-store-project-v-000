class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:email].nil? || params[:email].blank?
      redirect_to login_path
    else
      user = User.find_by(email: params[:email])
      return redirect_to login_path unless user.try(:authenticate, params[:password])
      session[:user_id] = user.id
      redirect_to store_path
    end
  end

  def destroy
    unless session[:user_id].nil?
      session.delete :user_id
    end
    redirect_to login_path
  end

end
