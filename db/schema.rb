# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151109193135) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "slug"
    t.string   "status"
    t.string   "twitter_name"
  end

  create_table "events_users", id: false, force: :cascade do |t|
    t.integer "event_id"
    t.integer "user_id"
  end

  add_index "events_users", ["event_id"], name: "index_events_users_on_event_id", using: :btree
  add_index "events_users", ["user_id"], name: "index_events_users_on_user_id", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "playlists", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.integer  "event_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "slug"
    t.boolean  "featured"
    t.text     "description"
    t.boolean  "listed"
    t.integer  "video_count"
  end

  create_table "playlists_events", id: false, force: :cascade do |t|
    t.integer "event_id"
    t.integer "playlist_id"
  end

  add_index "playlists_events", ["event_id"], name: "index_playlists_events_on_event_id", using: :btree
  add_index "playlists_events", ["playlist_id"], name: "index_playlists_events_on_playlist_id", using: :btree

  create_table "playlists_videos", id: false, force: :cascade do |t|
    t.integer "playlist_id"
    t.integer "video_id"
  end

  add_index "playlists_videos", ["playlist_id"], name: "index_playlists_videos_on_playlist_id", using: :btree
  add_index "playlists_videos", ["video_id"], name: "index_playlists_videos_on_video_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "user_id"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "major"
    t.string   "slug"
  end

  create_table "tags_videos", id: false, force: :cascade do |t|
    t.integer "video_id"
    t.integer "tag_id"
  end

  add_index "tags_videos", ["tag_id"], name: "index_tags_videos_on_tag_id", using: :btree
  add_index "tags_videos", ["tag_id"], name: "index_videos_tags_on_tag_id", using: :btree
  add_index "tags_videos", ["video_id"], name: "index_tags_videos_on_video_id", using: :btree
  add_index "tags_videos", ["video_id"], name: "index_videos_tags_on_video_id", using: :btree

  create_table "upcomings", force: :cascade do |t|
    t.string   "name"
    t.integer  "event_id"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "status"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.integer  "role_id"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "videos", force: :cascade do |t|
    t.string   "title"
    t.string   "url"
    t.integer  "event_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "slug"
    t.string   "speaker_name"
    t.string   "speaker_url"
    t.string   "status"
    t.string   "uid"
    t.integer  "likes"
    t.integer  "dislikes"
    t.integer  "views"
    t.text     "description"
    t.boolean  "featured"
    t.boolean  "hd"
    t.boolean  "R18"
  end

  add_index "videos", ["event_id"], name: "index_videos_on_event_id", using: :btree

end
