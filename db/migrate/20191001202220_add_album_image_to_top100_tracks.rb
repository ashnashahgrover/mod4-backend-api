class AddAlbumImageToTop100Tracks < ActiveRecord::Migration[6.0]
  def change
    add_column :top100_tracks, :album_image, :string
  end
end
