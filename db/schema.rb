# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_07_15_224559) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_artists_on_name"
  end

  create_table "djs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_djs_on_name"
  end

  create_table "spins", force: :cascade do |t|
    t.bigint "dj_id"
    t.boolean "artist_is_local", default: false
    t.string "track"
    t.string "release"
    t.string "label"
    t.text "notes"
    t.string "lastfm_large_image"
    t.datetime "played_at"
    t.string "chirp_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "artist_id"
    t.index ["artist_id"], name: "index_spins_on_artist_id"
    t.index ["dj_id"], name: "index_spins_on_dj_id"
  end

  add_foreign_key "spins", "artists"
  add_foreign_key "spins", "djs"
end
