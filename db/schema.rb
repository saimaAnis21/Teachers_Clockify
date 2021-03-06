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

ActiveRecord::Schema.define(version: 2021_03_16_151258) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "group_times", force: :cascade do |t|
    t.bigint "time_spent_id", null: false
    t.bigint "group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_group_times_on_group_id"
    t.index ["time_spent_id"], name: "index_group_times_on_time_spent_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "Icon"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "time_spents", force: :cascade do |t|
    t.string "name"
    t.integer "Amount"
    t.bigint "author_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_time_spents_on_author_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "group_times", "groups"
  add_foreign_key "group_times", "time_spents"
  add_foreign_key "groups", "users"
  add_foreign_key "time_spents", "users", column: "author_id"
end
