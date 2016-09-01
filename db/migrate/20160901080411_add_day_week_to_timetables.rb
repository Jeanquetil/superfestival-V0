class AddDayWeekToTimetables < ActiveRecord::Migration[5.0]
  def change
    add_column :timetables, :day_week, :string
  end
end
