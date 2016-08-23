class FestivalsController < ApplicationController

  def show
    @festival = Festival.find(params[:id])
    @dates = (@festival.start_date..@festival.end_date).map(&:to_s)
    if params[:date]
      @concerts = @festival.concerts.of_the_day(params[:date].to_datetime + 6.hours)
    else
      @concerts = @festival.concerts
    end
    authorize @festival
  end

end
