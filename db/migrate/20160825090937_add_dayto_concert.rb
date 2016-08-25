class AddDaytoConcert < ActiveRecord::Migration[5.0]
  def change
    add_column :concerts, :day, :integer
  end
end
