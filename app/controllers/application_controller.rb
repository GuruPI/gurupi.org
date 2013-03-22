# encoding: UTF-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :permission_denied, :current_user_provider

  def permission_denied
    flash[:error] = "Sorry, you not allowed to access that page."
    redirect_to root_url
  end

  private
    def current_user
      @current_user ||= User.joins(:identities).where("identities.uid = ?", session[:user_uid]).first if session[:user_uid]      
    end

    def current_user_provider
      @current_user_provider = Identity.find_by_uid(session[:user_uid]) if session[:user_uid]
    end

end

