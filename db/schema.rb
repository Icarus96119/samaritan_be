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

ActiveRecord::Schema.define(version: 2020_07_08_155253) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conversations", force: :cascade do |t|
    t.bigint "request_id", null: false
    t.bigint "user_id", null: false
    t.bigint "message_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["message_id"], name: "index_conversations_on_message_id"
    t.index ["request_id"], name: "index_conversations_on_request_id"
    t.index ["user_id"], name: "index_conversations_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "requests", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "description"
    t.string "requestType"
    t.float "latitude"
    t.float "longitude"
    t.string "address"
    t.boolean "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_requests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "firstName"
    t.string "lastName"
    t.string "email"
    t.string "password_digest"
    t.string "attachment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "conversations", "messages"
  add_foreign_key "conversations", "requests"
  add_foreign_key "conversations", "users"
  add_foreign_key "messages", "users"
  add_foreign_key "requests", "users"
end
