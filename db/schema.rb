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

ActiveRecord::Schema.define(version: 20140503134054) do

  create_table "alliances", force: true do |t|
    t.string   "name"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "alliances_users", force: true do |t|
    t.integer "alliance_id"
    t.integer "user_id"
  end

  create_table "armies", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "point_cost"
    t.string   "army_type"
    t.integer  "movement_rate"
    t.integer  "game_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "x_cord"
    t.integer  "y_cord"
    t.integer  "turn_count"
    t.integer  "alliance_id"
    t.boolean  "is_winner",     default: false
    t.boolean  "is_loser",      default: false
  end

  create_table "comments", force: true do |t|
    t.string   "content"
    t.string   "comment_type"
    t.integer  "user_id"
    t.integer  "army_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "game_masters", force: true do |t|
    t.integer "game_id"
    t.integer "user_id"
  end

  create_table "games", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "objective"
    t.text     "details"
    t.integer  "map_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "rule_set"
    t.integer  "game_master_id"
  end

  create_table "games_users", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "game_id"
  end

  create_table "maps", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "spaces", force: true do |t|
    t.integer  "x_cord"
    t.integer  "y_cord"
    t.string   "terrain"
    t.integer  "map_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "victory_points"
    t.integer  "army_id"
  end

  create_table "users", force: true do |t|
    t.string   "name"
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
    t.string   "theme"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
