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

ActiveRecord::Schema.define(version: 20150413070152) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "categories", ["name"], name: "index_categories_on_name", unique: true, using: :btree

  create_table "items", force: :cascade do |t|
    t.string   "title"
    t.string   "kind"
    t.string   "author"
    t.text     "summary"
    t.integer  "number_of_pages"
    t.string   "filepicker_url"
    t.string   "code"
    t.string   "publisher"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "quantity",        default: 1, null: false
    t.integer  "added_by_id"
    t.integer  "available_count"
    t.integer  "category_id"
    t.integer  "subject_id"
    t.integer  "school_level_id"
  end

  add_index "items", ["added_by_id"], name: "index_items_on_added_by_id", using: :btree
  add_index "items", ["category_id"], name: "index_items_on_category_id", using: :btree
  add_index "items", ["code"], name: "index_items_on_code", using: :btree
  add_index "items", ["school_level_id"], name: "index_items_on_school_level_id", using: :btree
  add_index "items", ["subject_id"], name: "index_items_on_subject_id", using: :btree

  create_table "members", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "full_name"
    t.string   "english_name"
    t.string   "sid"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "members", ["sid"], name: "index_members_on_sid", using: :btree

  create_table "reservations", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "member_id"
    t.integer  "checked_out_by_id"
    t.integer  "checked_in_by_id"
    t.datetime "checked_out_at"
    t.datetime "checked_in_at"
    t.datetime "due_date"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.text     "notes"
    t.text     "check_in_notes"
    t.text     "check_out_notes"
  end

  add_index "reservations", ["item_id"], name: "index_reservations_on_item_id", using: :btree

  create_table "school_levels", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "school_levels", ["name"], name: "index_school_levels_on_name", unique: true, using: :btree

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "subjects", ["name"], name: "index_subjects_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "guest",                  default: false
    t.string   "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "items", "categories"
  add_foreign_key "items", "school_levels"
  add_foreign_key "items", "subjects"
  add_foreign_key "reservations", "items"
end
