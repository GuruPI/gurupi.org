# encoding: UTF-8
class WelcomeController < ApplicationController
  def index
    @posts = Post.limit(6).order('created_at desc')
    @event = Event.last
  end
end

