# encoding: UTF-8
class SessionsController < ApplicationController

  def create
    auth = request.env['omniauth.auth']
    @user = User.find_by_email(auth["info"]["email"])
    @identity = Identity.find_with_omniauth(auth)
    if @user
      unless @identity
        @identity = Identity.create_with_omniauth(auth, @user)
      end             
    else
      @user = User.create_with_omniauth(auth)
      @identity = Identity.create_with_omniauth(auth, @user)    
    end
    session[:user_uid] =  @identity.uid
    redirect_to root_url, notice: "Seja Bem-vindo!"
  end

  def destroy
    reset_session
    redirect_to root_url, :notice => "Volte sempre… :)"
  end

  def failure
    redirect_to root_url, :error => 'Falha na autenticação.'
  end

end
