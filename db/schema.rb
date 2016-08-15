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

ActiveRecord::Schema.define(version: 20160815132531) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "availibilities", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "hunt_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hunt_id"], name: "index_availibilities_on_hunt_id", using: :btree
  end

  create_table "bookings", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "price"
    t.integer  "hunt_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hunt_id"], name: "index_bookings_on_hunt_id", using: :btree
    t.index ["user_id"], name: "index_bookings_on_user_id", using: :btree
  end

  create_table "hunts", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.integer  "day_price"
    t.integer  "capacity"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_hunts_on_user_id", using: :btree
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "license_number"
    t.string   "avatar_picture"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["user_id"], name: "index_profiles_on_user_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "rating"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "hunt_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hunt_id"], name: "index_reviews_on_hunt_id", using: :btree
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "availibilities", "hunts"
  add_foreign_key "bookings", "hunts"
  add_foreign_key "bookings", "users"
end
