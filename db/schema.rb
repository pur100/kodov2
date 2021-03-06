# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_13_103424) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "contributions", force: :cascade do |t|
    t.bigint "events_id", null: false
    t.bigint "speakers_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["events_id"], name: "index_contributions_on_events_id"
    t.index ["speakers_id"], name: "index_contributions_on_speakers_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.integer "seats"
    t.string "location"
    t.string "tags", array: true
    t.string "themes", array: true
    t.boolean "published", default: false
    t.boolean "free"
    t.string "podcast"
    t.string "video"
    t.json "payload"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "latitude"
    t.float "longitude"
    t.integer "user_id"
    t.string "picture"
    t.integer "category_id"
    t.string "category"
  end

  create_table "speakers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "job_title"
    t.string "avatar"
    t.string "specialty"
    t.string "establishments"
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
    t.boolean "superadmin_role", default: false
    t.boolean "supervisor_role", default: false
    t.boolean "user_role", default: true
    t.string "avatar"
    t.string "description"
    t.boolean "is_speaker", default: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "contributions", "events", column: "events_id"
  add_foreign_key "contributions", "speakers", column: "speakers_id"
end
