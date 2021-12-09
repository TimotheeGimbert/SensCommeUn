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

ActiveRecord::Schema.define(version: 2021_12_09_150449) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "activity_sector_id", null: false
    t.bigint "organization_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["activity_sector_id"], name: "index_activities_on_activity_sector_id"
    t.index ["organization_id"], name: "index_activities_on_organization_id"
  end

  create_table "activity_sectors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "external_stakeholders", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.string "name"
    t.string "email"
    t.bigint "stakeholder_category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["organization_id"], name: "index_external_stakeholders_on_organization_id"
    t.index ["stakeholder_category_id"], name: "index_external_stakeholders_on_stakeholder_category_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "nickname"
    t.datetime "creation_date"
    t.string "address"
    t.string "address_complement"
    t.string "zip_code"
    t.bigint "city_id", null: false
    t.string "email"
    t.string "phone_number"
    t.bigint "status_id", null: false
    t.string "siren"
    t.text "description"
    t.bigint "activity_sector_id", null: false
    t.string "naf_ape"
    t.string "logo_url"
    t.string "website_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["activity_sector_id"], name: "index_organizations_on_activity_sector_id"
    t.index ["city_id"], name: "index_organizations_on_city_id"
    t.index ["status_id"], name: "index_organizations_on_status_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "city_id", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_profiles_on_city_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "stakeholder_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "activities", "activity_sectors"
  add_foreign_key "activities", "organizations"
  add_foreign_key "external_stakeholders", "organizations"
  add_foreign_key "external_stakeholders", "stakeholder_categories"
  add_foreign_key "organizations", "activity_sectors"
  add_foreign_key "organizations", "cities"
  add_foreign_key "organizations", "statuses"
  add_foreign_key "profiles", "cities"
  add_foreign_key "profiles", "users"
end
