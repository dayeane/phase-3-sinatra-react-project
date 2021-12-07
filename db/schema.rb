# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_07_032221) do

  create_table "costs", force: :cascade do |t|
    t.integer "costtable_id"
    t.string "costtable_type"
    t.integer "trip_id"
    t.integer "amount"
    t.index ["trip_id"], name: "index_costs_on_trip_id"
  end

  create_table "hotels", force: :cascade do |t|
    t.integer "trip_id"
    t.string "check_in"
    t.string "check_out"
    t.string "location"
    t.index ["trip_id"], name: "index_hotels_on_trip_id"
  end

  create_table "providers", force: :cascade do |t|
    t.date "date"
    t.integer "trip_id"
    t.string "note"
    t.index ["trip_id"], name: "index_providers_on_trip_id"
  end

  create_table "stops", force: :cascade do |t|
    t.integer "trip_id"
    t.string "stop_reason"
    t.string "note"
    t.index ["trip_id"], name: "index_stops_on_trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string "from"
    t.string "to"
    t.date "depart_date"
    t.integer "budget"
  end

end
