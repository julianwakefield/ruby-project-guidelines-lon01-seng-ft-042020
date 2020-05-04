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

ActiveRecord::Schema.define(version: 20200503171623) do

  create_table "bookings", force: :cascade do |t|
    t.string  "user_id"
    t.string  "property_id"
    t.integer "price"
    t.string  "payment_status"
  end

  create_table "properties", force: :cascade do |t|
    t.string  "title"
    t.integer "no_of_rooms"
    t.string  "self_catered"
    t.string  "wi_fi"
    t.integer "price_per_night"
  end

  create_table "users", force: :cascade do |t|
    t.string  "name"
    t.integer "wallet"
  end

end
