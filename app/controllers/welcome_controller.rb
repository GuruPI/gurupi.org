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

  def vote_increment
   @lecture = Lecture.find(params[:lecture_id])
   if params[:commit] == 'gostei'
     @lecture.increment(:positive_vote)
     @lecture.update_attribute(:positive_vote, @lecture.positive_vote)
   elsif params[:commit] == 'naogostei'
     @lecture.increment(:negative_vote)
     @lecture.update_attribute(:negative_vote, @lecture.negative_vote)
   end
   redirect_to root_url
  end

end

