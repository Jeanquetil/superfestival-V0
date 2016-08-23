class FestivalsController < ApplicationController

  def show
    @festival = Festival.find(params[:id])
    @concerts = @festival.concerts
    authorize @festival
  end

end
