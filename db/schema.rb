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

ActiveRecord::Schema[7.0].define(version: 2023_03_31_190926) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", null: false
    t.string "full_name"
    t.string "uid"
    t.string "avatar_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
  end

  create_table "campuses", id: :string, force: :cascade do |t|
    t.string "name"
    t.string "district_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_campuses_on_id", unique: true
  end

  create_table "data_imports", id: :serial, force: :cascade do |t|
    t.binary "files", default: [], array: true
    t.binary "images", default: [], array: true
    t.string "district_id"
    t.string "campus_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_data_imports_on_id", unique: true
  end

  create_table "districts", id: :string, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_districts_on_id", unique: true
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "district_id"
    t.string "campus_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_admin", default: false
    t.index ["id"], name: "index_users_on_id", unique: true
  end

  add_foreign_key "campuses", "districts", on_delete: :cascade
  add_foreign_key "data_imports", "campuses", on_delete: :cascade
  add_foreign_key "data_imports", "districts", on_delete: :cascade
  add_foreign_key "users", "campuses", on_delete: :cascade
  add_foreign_key "users", "districts", on_delete: :cascade
end
