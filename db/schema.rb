# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_01_202220) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "top100_tracks", force: :cascade do |t|
    t.string "spotify_id"
    t.string "album_name"
    t.string "album_id"
    t.string "artist_name"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "artist_id"
    t.string "album_image"
  end

  create_table "user_top100_tracks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "top100_track_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["top100_track_id"], name: "index_user_top100_tracks_on_top100_track_id"
    t.index ["user_id"], name: "index_user_top100_tracks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.string "spotify_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "user_top100_tracks", "top100_tracks"
  add_foreign_key "user_top100_tracks", "users"
end
