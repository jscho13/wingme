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

ActiveRecord::Schema.define(version: 20160125195622) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "user_friends", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.boolean  "pending",    default: true, null: false
  end

  add_index "user_friends", ["friend_id"], name: "index_user_friends_on_friend_id", using: :btree
  add_index "user_friends", ["user_id", "friend_id"], name: "index_user_friends_on_user_id_and_friend_id", unique: true, using: :btree
  add_index "user_friends", ["user_id"], name: "index_user_friends_on_user_id", using: :btree

  create_table "user_matches", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "match_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.boolean  "pending",            default: true, null: false
    t.boolean  "pending_acceptance", default: true, null: false
  end

  add_index "user_matches", ["match_id"], name: "index_user_matches_on_match_id", using: :btree
  add_index "user_matches", ["user_id", "match_id"], name: "index_user_matches_on_user_id_and_match_id", unique: true, using: :btree
  add_index "user_matches", ["user_id"], name: "index_user_matches_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",                                null: false
    t.string   "gender",                              null: false
    t.string   "address"
    t.integer  "zip_code"
    t.string   "description"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "picture"
    t.string   "provider"
    t.string   "uid"
    t.string   "city"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "user_friends", "users"
  add_foreign_key "user_matches", "users"
end
