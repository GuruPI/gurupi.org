# encoding: UTF-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :permission_denied

  def permission_denied
    flash[:error] = "Sorry, you not allowed to access that page."
    redirect_to root_url
  end

  private
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end



end

