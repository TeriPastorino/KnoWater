class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    #look up once
    @current_user ||= User.find(session[:uid]) if session[:uid]
  end

  # make available w/i views


end
