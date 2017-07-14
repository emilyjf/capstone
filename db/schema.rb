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

ActiveRecord::Schema.define(version: 20170714015534) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appts", force: :cascade do |t|
    t.string "scheduled_slot"
    t.integer "poll_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "scheduled_slot2"
    t.string "scheduled_slot3"
    t.string "scheduled_slot4"
    t.string "chosen"
  end

  create_table "polls", force: :cascade do |t|
    t.integer "admin_id"
    t.string "title"
    t.string "status"
    t.string "invitee"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "address"
    t.string "city"
    t.string "state"
  end

  create_table "responses", force: :cascade do |t|
    t.integer "user_id"
    t.integer "appt_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "answer"
    t.integer "poll_response_id"
  end

  create_table "user_polls", force: :cascade do |t|
    t.integer "user_id"
    t.integer "poll_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "userpolls", force: :cascade do |t|
    t.integer "user_id"
    t.integer "poll_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "password_digest"
  end

end
