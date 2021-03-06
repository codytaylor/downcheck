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

ActiveRecord::Schema.define(version: 20131110155107) do

  create_table "check_data", force: true do |t|
    t.datetime "date_checked"
    t.integer  "check_id"
    t.text     "status"
    t.integer  "response_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "checks", force: true do |t|
    t.integer  "site_id"
    t.text     "name"
    t.text     "url"
    t.integer  "immediate"
    t.date     "start_date"
    t.integer  "minute"
    t.integer  "hour"
    t.integer  "day_of_month"
    t.integer  "month"
    t.integer  "day_of_week"
    t.integer  "check_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "notify"
    t.integer  "active"
  end

  create_table "sites", force: true do |t|
    t.integer  "user_id"
    t.text     "name"
    t.text     "url"
    t.integer  "check_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
