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

ActiveRecord::Schema.define(version: 20150220113444) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "uri",        limit: 64
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "categories", ["uri"], name: "index_categories_on_uri", using: :btree

  create_table "cities", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "uri",        limit: 64
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "cities", ["uri"], name: "index_cities_on_uri", using: :btree

  create_table "images", force: :cascade do |t|
    t.string   "attachment", limit: 255
    t.integer  "item_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "images", ["item_id"], name: "fk_rails_b9af74bd6c", using: :btree

  create_table "items", force: :cascade do |t|
    t.string   "title",          limit: 255
    t.decimal  "price",                        precision: 10
    t.text     "content",        limit: 65535
    t.string   "email",          limit: 255
    t.string   "phone",          limit: 255
    t.integer  "category_id",    limit: 4
    t.integer  "subcategory_id", limit: 4
    t.integer  "city_id",        limit: 4
    t.integer  "user_id",        limit: 4
    t.string   "state",          limit: 32
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "items", ["category_id"], name: "index_items_on_category_id", using: :btree
  add_index "items", ["city_id"], name: "index_items_on_city_id", using: :btree
  add_index "items", ["state"], name: "index_items_on_state", using: :btree
  add_index "items", ["subcategory_id"], name: "index_items_on_subcategory_id", using: :btree
  add_index "items", ["user_id"], name: "index_items_on_user_id", using: :btree

  create_table "subcategories", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "uri",         limit: 64
    t.integer  "category_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "subcategories", ["category_id"], name: "index_subcategories_on_category_id", using: :btree
  add_index "subcategories", ["uri"], name: "index_subcategories_on_uri", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "name",                   limit: 255, default: "", null: false
    t.integer  "city_id",                limit: 4
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["city_id"], name: "index_users_on_city_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "images", "items"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "cities"
  add_foreign_key "items", "subcategories"
  add_foreign_key "items", "users"
  add_foreign_key "subcategories", "categories"
end
