# encoding: UTF-8
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
    flash[:notice] = 'Palestra criada com sucesso.' if @lecture.save
    respond_with @lecture, :location => event_path(@event)
  end

  def update
    @lecture = Lecture.find_by_slug(params[:id])
    flash[:notice] = 'Palestra atualizada com sucesso.' if @lecture.update_attributes(params[:lecture])
    respond_with @lecture
  end

  def destroy
    @event = Event.find_by_slug(params[:event_id])
    @lecture = @event.lectures.find_by_slug(params[:id]).destroy
    flash[:notice] = 'Palestra deletada com sucesso' if @lecture.destroy
    respond_with @lecture, :location => event_path(@event)
  end

end

