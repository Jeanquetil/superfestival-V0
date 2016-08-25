class FestivalsController < ApplicationController

  skip_before_action :authenticate_user!, only: [ :index, :show]

  def show
    @festival = Festival.find(params[:id])


    if params[:day]
      @concerts = @festival.concerts.where(day: params[:day])
      @day_begin = @concerts.order(:start_time).first.start_time.to_time.hour
      @day_end = @concerts.order(:end_time).last.end_time.to_time.hour + 1
      @day_duration = @day_end - @day_begin
      @hour_in_a_day = @day_end - @day_begin - 1
      @timetable = current_user.find_or_create_timetable_for!(@festival, params[:day])
    end
    authorize @festival
  end

end
