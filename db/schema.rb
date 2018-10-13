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

ActiveRecord::Schema.define(version: 2018_10_12_204616) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "lastfm_url"
    t.text "lastfm_bio"
    t.integer "spins_count", default: 0
    t.string "slug"
    t.string "discogs_url"
    t.index ["name"], name: "index_artists_on_name"
    t.index ["slug"], name: "index_artists_on_slug", unique: true
  end

  create_table "djs", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.integer "spins_count", default: 0
    t.index ["name"], name: "index_djs_on_name"
    t.index ["slug"], name: "index_djs_on_slug", unique: true
  end

  create_table "friendly_id_slugs", id: :serial, force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "labels", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_labels_on_name"
  end

  create_table "releases", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "spins_count", default: 0
    t.bigint "artist_id"
    t.index ["artist_id"], name: "index_releases_on_artist_id"
  end

  create_table "spins", force: :cascade do |t|
    t.bigint "dj_id"
    t.bigint "artist_id"
    t.boolean "artist_is_local", default: false
    t.string "track"
    t.bigint "release_id"
    t.bigint "label_id"
    t.text "notes"
    t.string "lastfm_large_image"
    t.datetime "played_at"
    t.string "chirp_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_spins_on_artist_id"
    t.index ["dj_id"], name: "index_spins_on_dj_id"
    t.index ["label_id"], name: "index_spins_on_label_id"
    t.index ["release_id"], name: "index_spins_on_release_id"
  end

  add_foreign_key "releases", "artists"
  add_foreign_key "spins", "artists"
  add_foreign_key "spins", "djs"
  add_foreign_key "spins", "releases"
end
