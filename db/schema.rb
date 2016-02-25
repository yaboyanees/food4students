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

ActiveRecord::Schema.define(version: 20160223205503) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adults", force: :cascade do |t|
    t.string   "name"
    t.integer  "job"
    t.integer  "cs"
    t.integer  "ret"
    t.integer  "pa"
    t.integer  "pen"
    t.integer  "ali"
    t.integer  "se"
    t.integer  "mil"
    t.integer  "other"
    t.integer  "household_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "children", force: :cascade do |t|
    t.string   "name"
    t.boolean  "student"
    t.boolean  "foster"
    t.boolean  "hmr"
    t.boolean  "hs"
    t.integer  "pay"
    t.integer  "ss"
    t.integer  "tru"
    t.integer  "pen"
    t.integer  "ann"
    t.integer  "sm"
    t.integer  "household_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "households", force: :cascade do |t|
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "phone"
    t.string   "email"
    t.string   "filler_name"
    t.string   "four"
    t.string   "signature"
    t.string   "casenum"
    t.string   "reviewed_by"
    t.string   "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "optionals", force: :cascade do |t|
    t.boolean  "hl"
    t.boolean  "indy"
    t.boolean  "azn"
    t.boolean  "blk"
    t.boolean  "pac"
    t.boolean  "wh"
    t.integer  "household_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "paygrades", force: :cascade do |t|
    t.string   "rank"
    t.string   "year"
    t.integer  "pay"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
