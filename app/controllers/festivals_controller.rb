class FestivalsController < ApplicationController

  def show
    @festival = Festival.find(params[:id])
    @dates = (@festival.start_date..@festival.end_date).map(&:to_date)
    if params[:date]
      @concerts = @festival.concerts.of_the_day(params[:date].to_datetime + 6.hours)
      @timetable = current_user.find_or_create_timetable_for!(@festival, params[:day])
    else
      @concerts = @festival.concerts
    end
    authorize @festival
  end

end
