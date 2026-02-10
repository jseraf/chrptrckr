# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2021_12_13_231237) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.bigint "record_id", null: false
    t.string "record_type", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.string "content_type"
    t.datetime "created_at", null: false
    t.string "filename", null: false
    t.string "key", null: false
    t.text "metadata"
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "artists", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "discogs_url"
    t.text "lastfm_bio"
    t.string "lastfm_url"
    t.string "name"
    t.string "slug"
    t.integer "spins_count", default: 0
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_artists_on_name"
    t.index ["slug"], name: "index_artists_on_slug", unique: true
  end

  create_table "djs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.string "slug"
    t.integer "spins_count", default: 0
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_djs_on_name"
    t.index ["slug"], name: "index_djs_on_slug", unique: true
  end

  create_table "friendly_id_slugs", id: :serial, force: :cascade do |t|
    t.datetime "created_at"
    t.string "scope"
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "labels", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_labels_on_name"
  end

  create_table "releases", force: :cascade do |t|
    t.bigint "artist_id"
    t.datetime "created_at", null: false
    t.bigint "discogs_id"
    t.string "discogs_img"
    t.integer "spins_count", default: 0
    t.string "title"
    t.datetime "updated_at", null: false
    t.integer "year", limit: 2
    t.index ["artist_id"], name: "index_releases_on_artist_id"
  end

  create_table "spins", force: :cascade do |t|
    t.bigint "artist_id"
    t.boolean "artist_is_local", default: false
    t.string "chirp_id"
    t.datetime "created_at", null: false
    t.bigint "dj_id"
    t.bigint "label_id"
    t.string "lastfm_large_image"
    t.text "notes"
    t.datetime "played_at"
    t.bigint "release_id"
    t.string "track"
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_spins_on_artist_id"
    t.index ["dj_id"], name: "index_spins_on_dj_id"
    t.index ["label_id"], name: "index_spins_on_label_id"
    t.index ["release_id"], name: "index_spins_on_release_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "releases", "artists"
  add_foreign_key "spins", "artists"
  add_foreign_key "spins", "djs"
  add_foreign_key "spins", "labels"
  add_foreign_key "spins", "releases"
end
