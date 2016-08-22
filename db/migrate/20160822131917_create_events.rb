class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.references :timetable, foreign_key: true
      t.references :concert, foreign_key: true

      t.timestamps
    end
  end
end
