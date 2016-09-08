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

ActiveRecord::Schema.define(version: 20160908134858) do

  create_table "five_results", force: :cascade do |t|
    t.integer  "R1"
    t.integer  "R2"
    t.integer  "R3"
    t.integer  "R4"
    t.integer  "R5"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "four_results", force: :cascade do |t|
    t.integer  "R1"
    t.integer  "R2"
    t.integer  "R3"
    t.integer  "R4"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "six_results", force: :cascade do |t|
    t.integer  "R1"
    t.integer  "R2"
    t.integer  "R3"
    t.integer  "R4"
    t.integer  "R5"
    t.integer  "R6"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "three_results", force: :cascade do |t|
    t.integer  "R1"
    t.integer  "R2"
    t.integer  "R3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "two_criteria", force: :cascade do |t|
    t.integer  "C1lowervalue"
    t.string   "C1loweroperator"
    t.integer  "C1uppervalue"
    t.string   "C1upperoperator"
    t.integer  "C2lowervalue"
    t.string   "C2loweroperator"
    t.decimal  "C2uppervalue"
    t.string   "C2upperoperator"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "two_outputs", force: :cascade do |t|
    t.decimal  "O1"
    t.decimal  "O2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "two_results", force: :cascade do |t|
    t.decimal  "R1"
    t.decimal  "R2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
