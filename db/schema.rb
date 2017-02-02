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

ActiveRecord::Schema.define(version: 20170202032022) do

  create_table "checks", force: :cascade do |t|
    t.datetime "date"
    t.integer  "length"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "route_id"
  end

  add_index "checks", ["route_id"], name: "index_checks_on_route_id"

  create_table "routes", force: :cascade do |t|
    t.string   "from_name",  null: false
    t.float    "from_long",  null: false
    t.float    "from_lat",   null: false
    t.string   "to_name",    null: false
    t.float    "to_long",    null: false
    t.float    "to_lat",     null: false
    t.string   "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
