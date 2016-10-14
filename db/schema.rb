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

ActiveRecord::Schema.define(version: 20140808235325) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.string   "name"
    t.text     "body"
    t.integer  "post_id"
    t.integer  "identity_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.date     "event_date"
    t.string   "hour"
    t.string   "place"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "place_url"
    t.boolean  "enable_lectures"
  end

  create_table "identities", force: true do |t|
    t.integer  "user_id"
    t.string   "uid"
    t.string   "provider"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "link"
    t.string   "image"
    t.string   "name"
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "lectures", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "positive_vote",  default: 0
    t.integer  "negative_vote",  default: 0
    t.integer  "user_id"
    t.integer  "event_id"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "relative_votes"
  end

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "roles", force: true do |t|
    t.string  "title"
    t.integer "user_id"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "gender"
    t.integer  "timezone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vote_lectures", force: true do |t|
    t.integer  "lecture_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
