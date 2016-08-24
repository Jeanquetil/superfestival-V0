class FestivalsController < ApplicationController

  skip_before_action :authenticate_user!, only: [ :index, :show]

  def show
    @festival = Festival.find(params[:id])

    if params[:day]
    # @concerts = @festival.concerts.of_the_day(params[:date].to_datetime + 6.hours)
      @timetable = current_user.find_or_create_timetable_for!(@festival, params[:day])
    end
    authorize @festival
  end

end
