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

ActiveRecord::Schema[8.1].define(version: 2026_02_26_172020) do
  create_table "api_tokens", force: :cascade do |t|
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.text "token", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_api_tokens_on_user_id"
  end

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

  create_table "company_profiles", force: :cascade do |t|
    t.string "city"
    t.string "company_name"
    t.string "company_size"
    t.string "country"
    t.datetime "created_at", null: false
    t.text "description"
    t.string "facebook_url"
    t.string "industry"
    t.boolean "is_hiring", default: false
    t.string "linkedin_url"
    t.string "phone_number"
    t.string "state"
    t.string "street_address"
    t.string "twitter_url"
    t.datetime "updated_at", null: false
    t.string "website_url"
    t.string "zip_code"
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

  create_table "user_profiles", force: :cascade do |t|
    t.text "bio"
    t.string "city"
    t.string "country"
    t.datetime "created_at", null: false
    t.string "current_company"
    t.string "current_industry"
    t.string "current_job_title"
    t.string "first_name"
    t.string "github_url"
    t.string "home_phone_number"
    t.boolean "is_looking_for_job", default: true
    t.boolean "is_open_to_relocation", default: false
    t.boolean "is_open_to_remote", default: false
    t.boolean "is_over_18", default: false
    t.string "last_name"
    t.string "linkedin_url"
    t.string "mobile_phone_number"
    t.string "portfolio_url"
    t.string "state"
    t.string "street_address"
    t.datetime "updated_at", null: false
    t.string "zip_code"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", null: false
    t.string "encrypted_password", default: "", null: false
    t.boolean "is_company", default: false, null: false
    t.string "jti", null: false
    t.string "name"
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.datetime "updated_at", null: false
    t.boolean "verified", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["jti"], name: "index_users_on_jti", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "api_tokens", "users"
  add_foreign_key "sessions", "users"
end
