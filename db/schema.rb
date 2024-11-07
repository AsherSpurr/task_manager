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

ActiveRecord::Schema[7.1].define(version: 2024_10_31_232035) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attributes", primary_key: "attribute_id", id: :serial, force: :cascade do |t|
    t.string "category", limit: 30
    t.string "title", limit: 200
    t.text "content", default: ""
    t.integer "user_id", null: false
    t.datetime "created_at", precision: nil, default: -> { "now()" }
  end

  create_table "category", id: :serial, force: :cascade do |t|
    t.string "category", limit: 200, null: false
  end

  create_table "posts", id: :serial, force: :cascade do |t|
    t.string "category", limit: 200
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "threads", primary_key: "thread_id", id: :serial, force: :cascade do |t|
    t.integer "attribute_id"
    t.text "content", default: ""
    t.integer "user_id", null: false
    t.datetime "created_at", precision: nil, default: -> { "now()" }
  end

  add_foreign_key "threads", "attributes", primary_key: "attribute_id", name: "threads_attribute_id_fkey"
end
