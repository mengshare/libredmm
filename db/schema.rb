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

ActiveRecord::Schema.define(version: 20150405031655) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "actresses_products", id: false, force: :cascade do |t|
    t.integer "actress_id"
    t.integer "product_id"
  end

  create_table "products", force: :cascade do |t|
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
    t.string   "actress_types",    default: [], array: true
    t.string   "categories",       default: [], array: true
    t.string   "directors",        default: [], array: true
    t.string   "genres",           default: [], array: true
    t.string   "sample_images",    default: [], array: true
    t.string   "scenes",           default: [], array: true
    t.string   "scatologies",      default: [], array: true
    t.string   "transsexualities", default: [], array: true
    t.string   "actresses",        default: [], array: true
    t.string   "tags",             default: [], array: true
  end

  add_index "products", ["code"], name: "index_products_on_code", unique: true, using: :btree
  add_index "products", ["maker"], name: "index_products_on_maker", using: :btree

end
