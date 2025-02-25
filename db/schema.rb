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

ActiveRecord::Schema[8.0].define(version: 2025_02_25_063231) do
  create_table "addresses", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "street", null: false
    t.string "city", null: false
    t.string "state", null: false
    t.string "zipcode", null: false
    t.string "area", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "order_id", null: false
    t.string "sku_code", null: false
    t.integer "quantity", null: false
    t.integer "price", null: false
    t.integer "total_amount", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "order_number", null: false
    t.integer "total_amount", null: false
    t.string "delivery_zipcode", null: false
    t.string "delivery_state", null: false
    t.string "delivery_city", null: false
    t.string "delivery_area", null: false
    t.string "delivery_address", null: false
    t.integer "tax", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "prefecture_codes", force: :cascade do |t|
    t.string "name", null: false
    t.string "code", null: false
    t.string "ew_flag", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "souko_zaikos", force: :cascade do |t|
    t.string "warehouse_code", null: false
    t.string "sku_code", null: false
    t.string "stock_type", null: false
    t.integer "stock", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "prefecture_code_id"
    t.index ["prefecture_code_id"], name: "index_souko_zaikos_on_prefecture_code_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "order_items", "orders"
  add_foreign_key "orders", "users"
  add_foreign_key "souko_zaikos", "prefecture_codes"
end
