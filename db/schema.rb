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

ActiveRecord::Schema.define(version: 2021_10_24_055440) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.bigint "patient_id"
    t.bigint "doctor_id"
    t.bigint "hospital_id"
    t.datetime "appointment_time"
    t.datetime "book_time"
    t.boolean "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doctor_id"], name: "index_appointments_on_doctor_id"
    t.index ["hospital_id"], name: "index_appointments_on_hospital_id"
    t.index ["patient_id"], name: "index_appointments_on_patient_id"
  end

  create_table "clerks", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "hospital_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hospital_id"], name: "index_clerks_on_hospital_id"
    t.index ["user_id"], name: "index_clerks_on_user_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.integer "mon", default: [], array: true
    t.integer "tue", default: [], array: true
    t.integer "wed", default: [], array: true
    t.integer "thu", default: [], array: true
    t.integer "fri", default: [], array: true
    t.integer "sat", default: [], array: true
    t.integer "sun", default: [], array: true
    t.bigint "user_id"
    t.bigint "hospital_id"
    t.bigint "specialization_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["hospital_id"], name: "index_doctors_on_hospital_id"
    t.index ["specialization_id"], name: "index_doctors_on_specialization_id"
    t.index ["user_id"], name: "index_doctors_on_user_id"
  end

  create_table "hospitals", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "patients", force: :cascade do |t|
    t.boolean "is_blocked"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_patients_on_user_id"
  end

  create_table "specializations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "todos", force: :cascade do |t|
    t.text "todo_text"
    t.date "due_date"
    t.boolean "completed"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "role"
    t.string "gender"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "appointments", "doctors"
  add_foreign_key "appointments", "hospitals"
  add_foreign_key "appointments", "patients"
  add_foreign_key "clerks", "hospitals"
  add_foreign_key "clerks", "users"
  add_foreign_key "doctors", "hospitals"
  add_foreign_key "doctors", "specializations"
  add_foreign_key "doctors", "users"
  add_foreign_key "patients", "users"
end
