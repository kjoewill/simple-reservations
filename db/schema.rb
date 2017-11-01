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

ActiveRecord::Schema.define(version: 20171014174642) do

  create_table "schedules", force: :cascade do |t|
    t.date     "day"
    t.string   "glider"
    t.string   "s0800"
    t.string   "s0900"
    t.string   "s1000"
    t.string   "s1100"
    t.string   "s1200"
    t.string   "s1300"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "s0830"
    t.string   "s0930"
    t.string   "s1030"
    t.string   "s1130"
    t.string   "s1230"
    t.string   "s1330"
    t.string   "s1400"
    t.string   "s1430"
    t.string   "s1500"
    t.string   "s1530"
    t.string   "s1600"
    t.string   "s1630"
  end

end
