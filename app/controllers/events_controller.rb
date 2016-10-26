class EventsController < ApplicationController
  respond_to :html
  filter_access_to :all

  def index
    @events = Event.order(event_date: :desc)
    @breadcrumb = "Agenda de eventos"
  end

  def show
    @event = Event.find_by_slug(params[:id])
    @breadcrumb = @event.name
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find_by_slug(params[:id])
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:notice] = 'Event was successfully created.'
      respond_with @event
    else
      render "new"
    end
  end

  def update
    @event = Event.find_by_slug(params[:id])
    if @event.update_attributes(event_params)
      flash[:notice] = 'Event was successfully updated.'
      respond_with @event
    else
      render "edit"
    end
  end

  protected
  def event_params
    params.require(:event).permit(:name, :description, :hour, :event_date, :place, :place_url, :enable_lectures)
  end
end
