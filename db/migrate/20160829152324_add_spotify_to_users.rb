class AddSpotifyToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :hash_spotify, :json
  end
end
