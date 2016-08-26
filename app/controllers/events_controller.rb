# require "pry-byebug"

class EventsController < ApplicationController
  before_action :set_event, only: [:destroy]

  def new
    @event = Event.new
  end

  def create
    @concert = Concert.find(params[:concert_id])
    @event = Event.new(concert: @concert)
    timetable = current_user.find_or_create_timetable_for!(@event.concert.festival, params[:day])
    authorize @event
    @event.timetable = timetable
    @day_begin = timetable.festival.concerts.where(day: timetable.day).order(:start_time).first.start_time.to_time.hour
    @day_end =timetable.festival.concerts.where(day: timetable.day).order(:end_time).last.end_time.to_time.hour + 1
    validation = []
    timetable.events.each do |event|
      if (event.concert.start_time < @event.concert.end_time && event.concert.end_time > @event.concert.start_time)
        validation << false
      else
        validation << true
      end

    end
    if validation.include?(false)
      @events = timetable.events
    else
      @event.save
      @events = timetable.events
      @events << @event
    end

  end

  def show
  end

  def destroy
    @event.destroy
    respond_to do |format|
       format.js
    end
  end

private
    # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
    authorize @event
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(:timetable_id, :concert_id)
  end
end
