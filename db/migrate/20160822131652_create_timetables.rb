class CreateTimetables < ActiveRecord::Migration[5.0]
  def change
    create_table :timetables do |t|
      t.references :user, foreign_key: true
      t.references :festival, foreign_key: true
      t.integer :day

      t.timestamps
    end
  end
end
