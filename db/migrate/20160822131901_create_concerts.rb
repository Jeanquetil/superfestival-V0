class CreateConcerts < ActiveRecord::Migration[5.0]
  def change
    create_table :concerts do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :stage
      t.references :festival, foreign_key: true
      t.references :artist, foreign_key: true

      t.timestamps
    end
  end
end
