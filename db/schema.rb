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

ActiveRecord::Schema.define(version: 20140707040634) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "logs", force: true do |t|
    t.string   "key"
    t.string   "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_reviews", force: true do |t|
    t.integer  "product_id"
    t.integer  "user_id"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "brand"
    t.string   "code"
    t.string   "cover_image"
    t.text     "description"
    t.string   "label"
    t.string   "maker"
    t.integer  "movie_length"
    t.string   "page"
    t.date     "release_date"
    t.string   "series"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "subtitle"
    t.string   "theme"
    t.string   "thumbnail_image"
    t.string   "boobs"
    t.string   "actresses",        default: [], array: true
    t.string   "actress_types",    default: [], array: true
    t.string   "categories",       default: [], array: true
    t.string   "directors",        default: [], array: true
    t.string   "genres",           default: [], array: true
    t.string   "sample_images",    default: [], array: true
    t.string   "scenes",           default: [], array: true
    t.string   "aliases",          default: [], array: true
    t.string   "scatologies",      default: [], array: true
    t.string   "transsexualities", default: [], array: true
  end

  add_index "products", ["code"], name: "index_products_on_code", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
