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

ActiveRecord::Schema.define(version: 20150130174559) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "admin",                  default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "cart_items", force: true do |t|
    t.integer "owner_id"
    t.string  "owner_type"
    t.integer "quantity"
    t.integer "item_id"
    t.string  "item_type"
    t.float   "price"
  end

  create_table "issues", force: true do |t|
    t.date     "date"
    t.string   "mark"
    t.string   "title"
    t.string   "picture"
    t.integer  "volume"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.boolean  "active"
  end

  create_table "order_items", force: true do |t|
    t.integer  "issue_id"
    t.integer  "order_id"
    t.decimal  "unit_price"
    t.integer  "quantity"
    t.decimal  "total_price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "order_items", ["issue_id"], name: "index_order_items_on_issue_id"
  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id"

  create_table "order_positions", force: true do |t|
    t.integer  "ordinal"
    t.integer  "amount"
    t.string   "completed"
    t.float    "price"
    t.integer  "issue_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_statuses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.decimal  "subtotal"
    t.decimal  "tax"
    t.decimal  "shipping"
    t.decimal  "total"
    t.integer  "order_status_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["order_status_id"], name: "index_orders_on_order_status_id"

  create_table "user_sessions", force: true do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_sessions", ["session_id"], name: "index_user_sessions_on_session_id"
  add_index "user_sessions", ["updated_at"], name: "index_user_sessions_on_updated_at"

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",                default: "", null: false
    t.string   "surname",                          null: false
    t.string   "login",                            null: false
    t.string   "crypted_password",                 null: false
    t.string   "password_salt",                    null: false
    t.string   "city",                             null: false
    t.string   "street",                           null: false
    t.string   "building",                         null: false
    t.string   "apartment"
    t.string   "zip",                              null: false
    t.string   "email",                            null: false
    t.string   "persistence_token",                null: false
    t.string   "single_access_token",              null: false
    t.string   "perishable_token",                 null: false
    t.boolean  "admin"
    t.integer  "login_count",         default: 0,  null: false
    t.integer  "failed_login_count",  default: 0,  null: false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
  end

end
