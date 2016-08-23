class FestivalsController < ApplicationController

  def show
    @festival = Festival.find(params[:id])
    @concerts = @festival.concerts
    @timetable = current_user.find_or_create_timetable_for!(@festival)
    authorize @festival
  end

end
