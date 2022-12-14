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

ActiveRecord::Schema[7.0].define(version: 2022_12_05_104653) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "arks", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "category_id", null: false
    t.bigint "artist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "date"
    t.string "image_url"
    t.index ["artist_id"], name: "index_arks_on_artist_id"
    t.index ["category_id"], name: "index_arks_on_category_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "birth_date"
    t.string "death_date"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "day_arks", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "ark_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ark_id"], name: "index_day_arks_on_ark_id"
    t.index ["user_id"], name: "index_day_arks_on_user_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "ark_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "hidden?", default: false
    t.index ["ark_id"], name: "index_favorites_on_ark_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "arks", "artists"
  add_foreign_key "arks", "categories"
  add_foreign_key "day_arks", "arks"
  add_foreign_key "day_arks", "users"
  add_foreign_key "favorites", "arks"
  add_foreign_key "favorites", "users"
end
