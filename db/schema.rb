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

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20180708101548) do
=======
ActiveRecord::Schema.define(version: 20180708075823) do
>>>>>>> 749485075a839f35ca59e2c179f6bbfd74983109

  create_table "graves", force: :cascade do |t|
    t.string "grave_search_id"
    t.string "grave_name"
    t.string "grave_image"
    t.datetime "meinichi"
    t.string "religion"
<<<<<<< HEAD
=======
    t.string "string"
>>>>>>> 749485075a839f35ca59e2c179f6bbfd74983109
    t.string "grave_comment"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
<<<<<<< HEAD

  create_table "topics", force: :cascade do |t|
    t.integer "user_id"
    t.string "topic_search_id"
    t.string "topic_name"
    t.string "topic_image"
    t.datetime "topic_meinichi"
    t.string "topic_bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
=======
>>>>>>> 749485075a839f35ca59e2c179f6bbfd74983109

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
