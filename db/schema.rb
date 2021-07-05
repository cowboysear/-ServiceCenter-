
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

ActiveRecord::Schema.define(version: 20151115033046) do

  create_table "binders", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "status",     limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "binders", ["user_id"], name: "fk_rails_fef6301657", using: :btree

  create_table "card_sets", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "code",         limit: 255
    t.date     "release_date"
    t.string   "border",       limit: 255
    t.string   "type",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cards", force: :cascade do |t|
    t.string   "artist",         limit: 255
    t.integer  "cmc",            limit: 4
    t.string   "colors",         limit: 255
    t.text     "flavor",         limit: 65535
    t.string   "uuid",           limit: 255
    t.string   "image_name",     limit: 255
    t.string   "layout",         limit: 255
    t.string   "mana_cost",      limit: 255
    t.string   "multiverse_id",  limit: 255
    t.string   "name",           limit: 255
    t.integer  "number",         limit: 4
    t.integer  "power",          limit: 4
    t.integer  "toughness",      limit: 4
    t.string   "rarity",         limit: 255
    t.text     "text",           limit: 65535
    t.string   "subtypes",       limit: 255
    t.string   "type",           limit: 255
    t.string   "types",          limit: 255
    t.integer  "card_set_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "card_image_uri", limit: 255
  end

  add_index "cards", ["card_set_id"], name: "fk_rails_2b6dc2726c", using: :btree

  create_table "sellables", force: :cascade do |t|
    t.integer  "binder_id",  limit: 4
    t.integer  "card_id",    limit: 4
    t.string   "name",       limit: 255
    t.integer  "quantity",   limit: 4
    t.decimal  "price",                  precision: 10
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "sellables", ["binder_id"], name: "fk_rails_7ddda41e89", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "binders", "users"
  add_foreign_key "cards", "card_sets"
  add_foreign_key "sellables", "binders"
end