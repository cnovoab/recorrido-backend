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

ActiveRecord::Schema.define(version: 2019_03_14_204344) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alerts", force: :cascade do |t|
    t.string "name", null: false
    t.integer "departure_city_id", null: false
    t.integer "destination_city_id", null: false
    t.integer "user_id", null: false
    t.float "price", null: false
    t.integer "service_stars"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lookup_results", force: :cascade do |t|
    t.bigint "lookup_id"
    t.datetime "departure_date", null: false
    t.float "price", null: false
    t.integer "bus_operator_id"
    t.string "bus_operator"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lookup_id"], name: "index_lookup_results_on_lookup_id"
  end

  create_table "lookups", force: :cascade do |t|
    t.bigint "alert_id"
    t.datetime "search_date", null: false
    t.float "min_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alert_id"], name: "index_lookups_on_alert_id"
  end

  add_foreign_key "lookup_results", "lookups"
  add_foreign_key "lookups", "alerts"
end
