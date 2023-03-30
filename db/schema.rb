# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_03_30_224700) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "admins", force: :cascade do |t|
    t.string "email", null: false
    t.string "full_name"
    t.string "uid"
    t.string "avatar_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
  end

  create_table "campuses", force: :cascade do |t|
    t.integer "campus_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "districts_id", null: false
    t.index ["campus_id"], name: "index_campuses_on_campus_id", unique: true
    t.index ["districts_id"], name: "index_campuses_on_districts_id"
  end

  create_table "data_imports", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "campuses_id"
    t.bigint "districts_id"
    t.binary "files", array: true
    t.binary "images", array: true
    t.index ["campuses_id"], name: "index_data_imports_on_campuses_id"
    t.index ["districts_id"], name: "index_data_imports_on_districts_id"
  end

  create_table "districts", force: :cascade do |t|
    t.integer "district_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["district_id"], name: "index_districts_on_district_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "campuses_id", null: false
    t.bigint "districts_id", null: false
    t.index ["campuses_id"], name: "index_users_on_campuses_id"
    t.index ["districts_id"], name: "index_users_on_districts_id"
    t.index ["user_id"], name: "index_users_on_user_id", unique: true
  end

  add_foreign_key "campuses", "districts", column: "districts_id"
  add_foreign_key "data_imports", "campuses", column: "campuses_id"
  add_foreign_key "data_imports", "districts", column: "districts_id"
  add_foreign_key "users", "campuses", column: "campuses_id"
  add_foreign_key "users", "districts", column: "districts_id"
end
