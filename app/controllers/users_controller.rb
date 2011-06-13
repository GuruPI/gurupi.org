# encoding: UTF-8
class UsersController < ApplicationController
  def index
    @users = User.all
  end
end
