class AddArtistIdToTop100Tracks < ActiveRecord::Migration[6.0]
  def change
    add_column :top100_tracks, :artist_id, :string
  end
end
