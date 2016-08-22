class TimetablesController < ApplicationController
  before_action :set_timetable, only: [:destroy]

  def create
    @timetable = Timetable.new(timetable_params)
    @timetable.user = current_user
    authorize @timetable
    respond_to do |format|
      if @timetable.save
        format.html { redirect_to @timetable, notice: 'Timetable was successfully created.' }
        format.json { render :show, status: :created, location: @timetable }
      else
        format.html { render :new }
        format.json { render json: @timetable.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @timetable.destroy
    respond_to do |format|
      format.html { redirect_to timetables_url, notice: 'Timetable was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_timetable
    @timetable = Timetable.find(params[:id])
    authorize @timetable
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def timetable_params
    params.require(:timetable).permit(:timetable_id, :concert_id)
  end
end
