class TimetablesController < ApplicationController
  before_action :set_timetable, only: [:destroy]

  require 'icalendar'

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

  def ics_export
    @timetables = Timetable.where(user: current_user, festival_id: params[:festival])
    authorize @timetables
    respond_to do |format|
      format.html
      format.ics do
        cal = Icalendar::Calendar.new
        filename = "Your festival calendar"
        @timetables.each do |timetable|
          timetable.events.each do |event|
            performance = Icalendar::Event.new
            performance.dtstart = event.concert.start_time
            performance.dtend = event.concert.end_time
            performance.summary = "#{event.timetable.festival.name} : #{event.concert.artist.name}"
            performance.location = event.concert.stage
            cal.add_event(performance)
          end
        end
        cal.publish
        render :text =>  cal.to_ical
        # send_data cal.to_ical, type: 'text/calendar', disposition: 'attachment', filename: filename
      end
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
