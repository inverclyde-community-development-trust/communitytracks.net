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

ActiveRecord::Schema.define(version: 2018_12_11_124801) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "contact_submissions", force: :cascade do |t|
    t.string "email"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "councillors", force: :cascade do |t|
    t.string "name"
    t.string "photo_url"
    t.string "council_url"
    t.bigint "ward_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ward_id"], name: "index_councillors_on_ward_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.string "organisation"
    t.text "description"
    t.string "contact"
    t.string "email"
    t.string "phone"
    t.string "website"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "time"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "map_feedbacks", force: :cascade do |t|
    t.string "email"
    t.text "text"
    t.bigint "map_layer_id"
    t.string "route_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["map_layer_id"], name: "index_map_feedbacks_on_map_layer_id"
  end

  create_table "map_layers", force: :cascade do |t|
    t.string "name"
    t.bigint "ward_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ward_id"], name: "index_map_layers_on_ward_id"
  end

  create_table "posts", force: :cascade do |t|
    t.text "body"
    t.string "title"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["remember_me_token"], name: "index_users_on_remember_me_token"
  end

  create_table "wards", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "show_on_homepage", default: false
    t.string "url_slug"
  end

  add_foreign_key "councillors", "wards"
  add_foreign_key "events", "users"
  add_foreign_key "map_feedbacks", "map_layers"
  add_foreign_key "map_layers", "wards"
  add_foreign_key "posts", "users"
end
