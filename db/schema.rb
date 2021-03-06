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

ActiveRecord::Schema.define(version: 2019_06_05_155506) do

  create_table "cities", force: :cascade do |t|
    t.string "city"
    t.string "state"
    t.decimal "lat"
    t.decimal "lng"
  end

  create_table "currently_forecasts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "time"
    t.string "summary"
    t.string "icon"
    t.decimal "temperature"
    t.decimal "apparentTemperature"
    t.decimal "humidity"
    t.decimal "visibility"
    t.integer "uvIndex"
    t.string "futureSummary"
    t.decimal "temperatureHigh"
    t.decimal "temperatureLow"
    t.integer "city_id"
    t.index ["city_id"], name: "index_currently_forecasts_on_city_id"
  end

  create_table "daily_forecasts", force: :cascade do |t|
    t.string "icon"
    t.integer "time"
    t.string "summary"
    t.decimal "precipProbability"
    t.decimal "temperatureHigh"
    t.decimal "temperatureLow"
    t.integer "city_id"
    t.index ["city_id"], name: "index_daily_forecasts_on_city_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "city_id"
    t.index ["city_id"], name: "index_favorites_on_city_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "hourly_forecasts", force: :cascade do |t|
    t.integer "time"
    t.decimal "temperature"
    t.integer "city_id"
    t.index ["city_id"], name: "index_hourly_forecasts_on_city_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "api_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
