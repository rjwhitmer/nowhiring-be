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

ActiveRecord::Schema[8.1].define(version: 2026_02_24_182226) do
  create_table "companies", force: :cascade do |t|
    t.string "address"
    t.string "city"
    t.string "company_contact_url"
    t.string "company_url"
    t.datetime "created_at", null: false
    t.date "date_founded"
    t.text "description"
    t.string "image_url"
    t.string "name"
    t.string "professional_sector"
    t.string "size"
    t.string "state"
    t.datetime "updated_at", null: false
    t.string "zipcode"
  end

  create_table "jobs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "description"
    t.integer "ending_base_salary_range"
    t.date "expected_start_date"
    t.integer "hourly_wage"
    t.boolean "is_active"
    t.boolean "is_hourly_wage"
    t.integer "starting_base_salary_range"
    t.string "title"
    t.datetime "updated_at", null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "ip_address"
    t.datetime "updated_at", null: false
    t.string "user_agent"
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "skills", force: :cascade do |t|
    t.string "category"
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "sessions", "users"
end
