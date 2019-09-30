class CreateUserTop100Tracks < ActiveRecord::Migration[6.0]
  def change
    create_table :user_top100_tracks do |t|
      t.references :user, null: false, foreign_key: true
      t.belongs_to :top100_track, null: false, foreign_key: true

      t.timestamps
    end
  end
end
