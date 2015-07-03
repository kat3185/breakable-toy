# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150703014940) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "course_instructors", force: :cascade do |t|
    t.integer  "course_id"
    t.integer  "instructor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "course_meetings", force: :cascade do |t|
    t.integer  "course_id",       null: false
    t.integer  "meeting_date_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", force: :cascade do |t|
    t.string   "title",       null: false
    t.text     "description", null: false
    t.string   "time"
    t.integer  "venue_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "instructors", force: :cascade do |t|
    t.string   "full_name",  null: false
    t.text     "bio",        null: false
    t.string   "email",      null: false
    t.string   "photo_url"
    t.string   "video_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "meeting_dates", force: :cascade do |t|
    t.date     "first",      null: false
    t.date     "second"
    t.date     "third"
    t.date     "fourth"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "registration_holders", force: :cascade do |t|
    t.string   "first_role"
    t.string   "second_role"
    t.string   "third_role"
    t.string   "fourth_role"
    t.string   "fifth_role"
    t.string   "sixth_role"
    t.integer  "first_course"
    t.integer  "second_course"
    t.integer  "third_course"
    t.integer  "fourth_course"
    t.integer  "fifth_course"
    t.integer  "sixth_course"
    t.integer  "student_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "registrations", force: :cascade do |t|
    t.integer  "course_id",                  null: false
    t.integer  "student_id",                 null: false
    t.string   "role",                       null: false
    t.boolean  "paid",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: :cascade do |t|
    t.string   "first_name", null: false
    t.string   "last_name",  null: false
    t.string   "email",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "venues", force: :cascade do |t|
    t.string   "building_name", null: false
    t.string   "address",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
