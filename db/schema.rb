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

ActiveRecord::Schema[7.0].define(version: 2023_01_06_203225) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "price"
    t.string "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "periods", force: :cascade do |t|
    t.integer "number_of_transactions"
    t.integer "amount_made"
    t.integer "total_tips"
    t.integer "total_tax"
    t.integer "total_number_of_items"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "number_of_items"
    t.string "items", default: [], array: true
    t.integer "total"
    t.integer "tax"
    t.integer "tip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "period_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "country"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tax_rate"
  end

end
