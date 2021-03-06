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

ActiveRecord::Schema.define(version: 2020_12_01_142700) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "flight_bookings", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "trip_id", null: false
    t.string "departure_airport_code"
    t.string "arrival_airport_code"
    t.string "airline"
    t.string "flight_number"
    t.integer "price"
    t.string "flight_class"
    t.datetime "departure_date_local"
    t.datetime "arrival_date_local"
    t.datetime "departure_date_utc"
    t.datetime "arrival_date_utc"
    t.boolean "booked", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "booking_link"
    t.index ["trip_id"], name: "index_flight_bookings_on_trip_id"
    t.index ["user_id"], name: "index_flight_bookings_on_user_id"
  end

  create_table "invitations", force: :cascade do |t|
    t.bigint "trip_id", null: false
    t.string "email"
    t.string "status", default: "Pending"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trip_id"], name: "index_invitations_on_trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.string "street"
    t.string "zip"
    t.string "city"
    t.string "country"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer "max_price"
    t.string "flight_class"
    t.datetime "latest_arrival"
    t.datetime "earliest_departure"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "airport_code"
    t.text "description"
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "job_title"
    t.string "company"
    t.boolean "host", default: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_trips", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "trip_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["trip_id"], name: "index_users_trips_on_trip_id"
    t.index ["user_id"], name: "index_users_trips_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "flight_bookings", "trips"
  add_foreign_key "flight_bookings", "users"
  add_foreign_key "invitations", "trips"
  add_foreign_key "trips", "users"
  add_foreign_key "users_trips", "trips"
  add_foreign_key "users_trips", "users"
end
