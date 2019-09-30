class CreateTop100Tracks < ActiveRecord::Migration[6.0]
  def change
    create_table :top100_tracks do |t|
      t.string :spotify_id
      t.string :album_name
      t.string :album_id
      t.string :artist_name
      t.string :name

      t.timestamps
    end
  end
end
