class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    #look up once
    @current_user ||= User.where(id: session[:user_id]).first if session[:user_id]
  end

  # make available w/i views


end
