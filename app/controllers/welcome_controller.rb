# encoding: UTF-8
class WelcomeController < ApplicationController
  layout "home"

  def index
    @posts = Post.limit(6).order('created_at desc')
    @event = Event.last
  end

  def about
    @breadcrumb = "Sobre"
    render :layout => "application"
  end

  def contact
    @breadcrumb = "Contato"
    render :layout => "contact"
  end

end

