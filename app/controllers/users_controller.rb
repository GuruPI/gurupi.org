# encoding: UTF-8
class UsersController < ApplicationController
  filter_access_to :change

  def index
    @users = User.all
  end

  def change
    @user = User.find(params[:id])
    if %(admin member guest).include? params[:role]
      @user.change_role(params[:role])
      redirect_to(users_path, :notice => 'Usuário atualizado.')
    else
      render :index
    end
  end
end
