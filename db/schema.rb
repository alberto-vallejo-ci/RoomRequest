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

ActiveRecord::Schema.define(version: 20160503200543) do

  create_table "asistants", force: :cascade do |t|
    t.integer  "code"
    t.string   "name"
    t.string   "carer"
    t.integer  "codeEvent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer  "codeEvent"
    t.string   "eventType"
    t.string   "ponenteName"
    t.string   "personInCharge"
    t.string   "phoneNum"
    t.boolean  "forniture"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "requests", force: :cascade do |t|
    t.date     "dateRequest"
    t.date     "dateEventI"
    t.date     "dateEventF"
    t.time     "timeEvent"
    t.integer  "eventCode"
    t.string   "nameRequesting"
    t.string   "phoneNum"
    t.string   "place"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

end
