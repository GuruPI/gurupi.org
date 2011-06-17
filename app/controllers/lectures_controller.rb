class LecturesController < ApplicationController

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
end

