class FestivalsController < ApplicationController

  def show
    @festival = Festival.find(params[:id])
  end

  private
end
