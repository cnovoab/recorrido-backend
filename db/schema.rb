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

ActiveRecord::Schema.define(version: 2019_03_16_101445) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alerts", force: :cascade do |t|
    t.string "name", null: false
    t.integer "departure_city_id", null: false
    t.integer "destination_city_id", null: false
    t.integer "user_id", null: false
    t.float "price", null: false
    t.integer "service_stars", default: 0, null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bus_travels", force: :cascade do |t|
    t.bigint "search_id"
    t.datetime "departure_date", null: false
    t.integer "service_stars", null: false
    t.float "price", null: false
    t.integer "bus_operator_id"
    t.string "bus_operator"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["search_id"], name: "index_bus_travels_on_search_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name", null: false
    t.integer "country_id", null: false
    t.string "url_name", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lookups", force: :cascade do |t|
    t.bigint "alert_id"
    t.float "min_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alert_id"], name: "index_lookups_on_alert_id"
  end

  create_table "searches", force: :cascade do |t|
    t.bigint "lookup_id"
    t.integer "resource_id"
    t.datetime "search_date", null: false
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lookup_id"], name: "index_searches_on_lookup_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bus_travels", "searches"
  add_foreign_key "lookups", "alerts"
  add_foreign_key "searches", "lookups"
end
