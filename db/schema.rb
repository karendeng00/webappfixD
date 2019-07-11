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

ActiveRecord::Schema.define(version: 2019_06_27_175600) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.bigint "user_id"
    t.bigint "issue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["issue_id"], name: "index_comments_on_issue_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "issues", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "image"
    t.text "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type"
    t.integer "likes"
    t.integer "favorites"
    t.bigint "user_id"
    t.string "email"
    t.string "phone"
    t.string "alternate_phone"
    t.string "group"
    t.string "urgency"
    t.string "impact"
    t.text "sensitive_info"
    t.string "campus"
    t.string "area"
    t.string "specific_location"
    t.string "room_number"
    t.boolean "service_animal"
    t.string "your_building"
    t.string "your_floor"
    t.string "your_room"
    t.string "request_type"
    t.string "issue_building"
    t.string "issue_floor"
    t.string "issue_room"
    t.string "service_type"
    t.string "fund_code"
    t.string "topic"
    t.string "name"
    t.index ["user_id"], name: "index_issues_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "netid"
    t.string "phone"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "alt_phone"
    t.string "email"
  end

  add_foreign_key "comments", "issues"
  add_foreign_key "comments", "users"
  add_foreign_key "issues", "users"
end
