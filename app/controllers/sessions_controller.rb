class SessionsController < ApplicationController
  def create
    user = User.find_or_create_by_omniauth(auth_hash)
    session[:uid] = @uid
    redirect_to root_path, notice: "Sign in Successfully"
  end

  

  protected

  def auth_hash
    request.env["omniauth.auth"]
  end
end