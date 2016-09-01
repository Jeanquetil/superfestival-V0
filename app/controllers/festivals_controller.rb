class FestivalsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show]

  def show
    @festival = Festival.find(params[:id])
    session[:current_festival_id] = @festival.id

    if current_user
      @timetables = @festival.timetables.where(user: current_user)
      @timetable = current_user.find_or_create_timetable_for!(@festival, 1)
      set_timetable_parameters(@festival, 1)
      set_impossible_concerts(@timetable)
    else
      set_timetable_parameters(@festival, 1)
    end
  end

  def display_timetable
    @festival = Festival.find(params[:festival_id])

    if params[:day]
      @timetable = current_user.find_or_create_timetable_for!(@festival, params[:day].to_i)
      set_timetable_parameters(@festival, params[:day].to_i)
      set_impossible_concerts(@timetable)
    end
  end

  def create_event
    @concert = Concert.find(params[:concert_id])
    @festival = @concert.festival
    @event = Event.new(concert: @concert)
    timetable = current_user.find_or_create_timetable_for!(@event.concert.festival, params[:day])
    @event.timetable = timetable
    @day_begin = timetable.festival.concerts.where(day: timetable.day).order(:start_time).first.start_time.to_time.hour
    @day_end = timetable.festival.concerts.where(day: timetable.day).order(:end_time).last.end_time.to_time.hour + 1
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
      set_impossible_concerts(@event.timetable)
    end
  end

  def destroy_event
    @event = Event.find(params[:id].to_i)
    @event.destroy
    respond_to do |format|
     format.js
    end
    set_impossible_concerts(@event.timetable)
  end

  private

  def set_timetable_parameters(festival, day)
    @concerts = festival.concerts.where(day: day)
    @day_begin = @concerts.order(:start_time).first.start_time.to_time.hour
    @day_end = @concerts.order(:end_time).last.end_time.to_time.hour + 1
    @day_duration = ((@day_end - @day_begin) > 0) ? (@day_end - @day_begin) : (24 - @day_begin + @day_end)
    @hour_in_a_day = ((@day_end - @day_begin) > 0) ? (@day_end - @day_begin - 1) : (23 - @day_begin + @day_end)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(:timetable_id, :concert_id)
  end

  def set_impossible_concerts(timetable)
    @impossible_concerts = []
    timetable.festival.timetables.where(user: current_user).each do |timetable|
      timetable.events.each do |event|
        impossible_by_event = event.concert.festival.concerts.select('id').where("(start_time <= ? AND end_time >= ?) OR (? <= start_time AND start_time < ?) OR (? < end_time AND end_time <= ?)", event.concert.start_time, event.concert.end_time, event.concert.start_time, event.concert.end_time, event.concert.start_time, event.concert.end_time)
        impossible_by_event.each do |concert|
          @impossible_concerts << concert.id
        end
      end
    end
    return @impossible_concerts
  end

end
