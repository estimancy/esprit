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

ActiveRecord::Schema.define(version: 20200213133421) do

  create_table "data_functions", force: :cascade do |t|
    t.integer  "requirement_id", limit: 4
    t.text     "content",        limit: 65535
    t.string   "attribute",      limit: 255
    t.string   "type",           limit: 255
    t.integer  "ret",            limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "requirements", force: :cascade do |t|
    t.text     "content",    limit: 65535
    t.float    "storypoint", limit: 24
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "transactional_functions", force: :cascade do |t|
    t.integer  "requirement_id", limit: 4
    t.text     "content",        limit: 65535
    t.string   "type",           limit: 255
    t.string   "traceability",   limit: 255
    t.integer  "det",            limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

end
