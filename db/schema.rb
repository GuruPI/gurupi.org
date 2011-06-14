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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110613230517) do

  create_table "events", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.date     "event_date"
    t.string   "hour"
    t.string   "place"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lectures", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "positive_vote", :default => 0
    t.integer  "negative_vote", :default => 0
    t.integer  "user_id"
    t.integer  "event_id"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "roles", :force => true do |t|
    t.string  "title"
    t.integer "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "email"
    t.string   "image"
    t.string   "link"
    t.string   "gender"
    t.integer  "timezone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
