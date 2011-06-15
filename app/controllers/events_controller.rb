class EventsController < ApplicationController

  respond_to :html

  def index
    @events = Event.all
  end

  def show
    @event = Event.find_by_slug(params[:id])
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find_by_slug(params[:id])
  end

  def create
    @event = Event.new(params[:event])
    if @event.save
      flash[:notice] = 'Event was successfully created.'
      respond_with @event
    else
      render "new"
    end
  end

  def update
    @event = Event.find_by_slug(params[:id])
    if @event.update_attributes(params[:event])
      flash[:notice] = 'Event was successfully updated.'
      respond_with @event
    else
      render "edit"
    end
  end

  def destroy
    flash[:notice] = 'Event was successfully deleted' if Event.find_by_slug(params[:id]).destroy
    respond_with @event, :location => events_url
  end

end

