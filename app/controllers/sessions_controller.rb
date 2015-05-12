class SessionsController < ApplicationController
  def create
    user = User.find_or_create_by_omniauth(auth_hash)
    session[:user_id] = user.id
    redirect_to root_path, notice: "Sign in Successful"
  end

  def destroy
    session.clear
    redirect_to root_path, notice: "Sign out Successful"
  end

  protected

  def auth_hash
    request.env["omniauth.auth"]
  end
end

