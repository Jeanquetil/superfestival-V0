class FestivalsController < ApplicationController

  skip_before_action :authenticate_user!, only: [ :index, :show]

  def show
    @festival = Festival.find(params[:id])
    session[:current_festival_id] = @festival.id

    if current_user
      @timetables = @festival.timetables
      @timetable = current_user.find_or_create_timetable_for!(@festival, 1)
      set_timetable_parameters(@festival, 1)
    else
      set_timetable_parameters(@festival, 1)
    end

    @events = @timetable.events
    @impossible_concerts = []
      @events.each do |event|
        impossible_by_event = @timetable.festival.concerts.select('id').where("(? <= start_time AND start_time < ?) OR (? < end_time AND end_time <= ?)", event.concert.start_time, event.concert.end_time, event.concert.start_time, event.concert.end_time)
        impossible_by_event.each do |concert|
          @impossible_concerts << concert.id
        end
      end
  end

  def display_timetable
    @festival = Festival.find(params[:festival_id])

    if params[:day]
      @timetable = current_user.find_or_create_timetable_for!(@festival, params[:day].to_i)
      set_timetable_parameters(@festival, params[:day].to_i)
    end
  end

  private

  def set_timetable_parameters(festival, day)
    @concerts = festival.concerts.where(day: day)
    @day_begin = @concerts.order(:start_time).first.start_time.to_time.hour
    @day_end = @concerts.order(:end_time).last.end_time.to_time.hour + 1
    @day_duration = ((@day_end - @day_begin) > 0) ? (@day_end - @day_begin) : (24 - @day_begin + @day_end)
    @hour_in_a_day = ((@day_end - @day_begin) > 0) ? (@day_end - @day_begin - 1) : (23 - @day_begin + @day_end)
  end

end
