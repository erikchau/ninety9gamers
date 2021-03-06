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

ActiveRecord::Schema.define(version: 20140801095444) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: true do |t|
    t.integer  "user_id",                                                                                  null: false
    t.string   "title",                                                                                    null: false
    t.string   "console",                                                                                  null: false
    t.text     "comments"
    t.integer  "price",                                                                                    null: false
    t.string   "condition",                                                                                null: false
    t.boolean  "sold",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "api_id"
    t.text     "thumb_url",  default: "http://webmaster.ypsa.org/wp-content/uploads/2012/08/no_thumb.jpg"
  end

  add_index "games", ["api_id"], name: "index_games_on_api_id", using: :btree
  add_index "games", ["console"], name: "index_games_on_console", using: :btree
  add_index "games", ["id"], name: "index_games_on_id", using: :btree
  add_index "games", ["title"], name: "index_games_on_title", using: :btree
  add_index "games", ["user_id"], name: "index_games_on_user_id", using: :btree

  create_table "sales", force: true do |t|
    t.integer  "game_id",    null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username",                  null: false
    t.string   "password_hash",             null: false
    t.string   "session_token",             null: false
    t.integer  "coins",         default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["session_token"], name: "index_users_on_session_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
