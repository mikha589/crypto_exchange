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

ActiveRecord::Schema[8.1].define(version: 2026_06_05_165031) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "market", null: false
    t.integer "order_type", default: 0, null: false
    t.decimal "price", precision: 18, scale: 2, null: false
    t.decimal "quantity", precision: 18, scale: 8, null: false
    t.integer "side", null: false
    t.integer "status", default: 0, null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "trades", force: :cascade do |t|
    t.integer "buy_order_id", null: false
    t.datetime "created_at", null: false
    t.string "market", null: false
    t.decimal "price", precision: 18, scale: 2, null: false
    t.decimal "quantity", precision: 18, scale: 8, null: false
    t.integer "sell_order_id", null: false
    t.datetime "updated_at", null: false
    t.index ["buy_order_id"], name: "index_trades_on_buy_order_id"
    t.index ["sell_order_id"], name: "index_trades_on_sell_order_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wallets", force: :cascade do |t|
    t.decimal "balance", precision: 18, scale: 8, default: "0.0", null: false
    t.datetime "created_at", null: false
    t.string "currency"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id", "currency"], name: "index_wallets_on_user_id_and_currency", unique: true
    t.index ["user_id"], name: "index_wallets_on_user_id"
  end

  add_foreign_key "orders", "users"
  add_foreign_key "wallets", "users"
end
