class FestivalsController < ApplicationController

  skip_before_action :authenticate_user!, only: [ :index, :show]

  def show
    @festival = Festival.find(params[:id])

    if params[:day]
      @concerts = @festival.concerts.where(day: params[:day])
      @timetable = current_user.find_or_create_timetable_for!(@festival, params[:day])
    end
    authorize @festival
  end

end
