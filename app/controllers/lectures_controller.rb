class LecturesController < ApplicationController
  filter_resource_access
  respond_to :html

  def index
    @lectures = Lecture.all
  end

  def show
    @lecture = Lecture.find_by_slug(params[:id])
  end

  def new
    @lecture = Lecture.new
  end

  def edit
    @lecture = Lecture.find_by_slug(params[:id])
  end

  def create
    @event = Event.find_by_slug(params[:event_id])
    @lecture = @event.lectures.create(params[:lecture])
    if @lecture.save
      flash[:notice] = 'Lecture was successfully created.'
      respond_with @lecture, :location => event_path(@event)
    else
      render 'new'
    end
  end

  def update
    @lecture = Lecture.find_by_slug(params[:id])
    if @lecture.update_attributes(params[:lecture])
      flash[:notice] = 'Lecture was successfully updated.'
      respond_with @lecture
    else
        render 'edit'
    end
  end

  def destroy
    @event = Event.find_by_slug(params[:event_id])
    @lecture = @event.lectures.find_by_slug(params[:id]).destroy
    flash[:notice] = 'Lecture was successfully deleted' if @lecture.destroy
    respond_with @lecture, :location => event_path(@event)
  end

  def vote_increment
   @vote_lecture = VoteLecture.where("user_id = ? and lecture_id = ?", current_user.id, params[:id])
   unless @vote_lecture.present?
     @lecture = Lecture.find(params[:id])
     if params[:commit] == 'gostei'
       @lecture.increment(:positive_vote)
       @lecture.update_attribute(:positive_vote, @lecture.positive_vote)
     elsif params[:commit] == 'naogostei'
       @lecture.increment(:negative_vote)
       @lecture.update_attribute(:negative_vote, @lecture.negative_vote)
     end
     @vote_lecture = VoteLecture.new
     @vote_lecture.user_id = current_user.id
     @vote_lecture.lecture_id = params[:id]
     @vote_lecture.save
   end
   redirect_to root_url
  end

  protected
  def load_lecture
    @lecture = Lecture.find_by_slug(params[:id])
  end

end

