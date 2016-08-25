class FestivalsController < ApplicationController

  skip_before_action :authenticate_user!, only: [ :index, :show]

  def show
    @festival = Festival.find(params[:id])
    @timetables = @festival.timetables

    authorize @festival
  end

  def display_timetable
    @festival = Festival.find(params[:festival_id])

    if params[:day]
      @timetable = current_user.find_or_create_timetable_for!(@festival, params[:day].to_i)
      @concerts = @festival.concerts.where(day: params[:day].to_i)
      @day_begin = @concerts.order(:start_time).first.start_time.to_time.hour
      @day_end = @concerts.order(:end_time).last.end_time.to_time.hour + 1
      @day_duration = ((@day_end - @day_begin) > 0) ? (@day_end - @day_begin) : (24 - @day_begin + @day_end)
      @hour_in_a_day = ((@day_end - @day_begin) > 0) ? (@day_end - @day_begin - 1) : (23 - @day_begin + @day_end)
    end

    authorize @festival
  end
end
