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

ActiveRecord::Schema.define(version: 20171129103540) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "material_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["material_id"], name: "index_categories_on_material_id", using: :btree
  end

  create_table "chats", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "sender_id"
    t.integer  "receiver_id"
  end

  create_table "materials", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.string   "category"
    t.string   "status"
    t.string   "address"
    t.string   "condition"
    t.string   "photo"
    t.string   "source"
    t.string   "supplier"
    t.integer  "price"
    t.integer  "quantity"
    t.integer  "lead_time"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.float    "latitude"
    t.float    "longitude"
    t.text     "description"
    t.boolean  "hidden",      default: false, null: false
    t.index ["user_id"], name: "index_materials_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "chat_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "content"
    t.string   "subject"
    t.index ["chat_id"], name: "index_messages_on_chat_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "purchases", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "material_id"
    t.string   "status"
    t.integer  "total_price"
    t.boolean  "insurance"
    t.integer  "shipping_cost"
    t.integer  "user_rating"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "hidden",        default: false, null: false
    t.index ["material_id"], name: "index_purchases_on_material_id", using: :btree
    t.index ["user_id"], name: "index_purchases_on_user_id", using: :btree
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
    t.integer  "age"
    t.string   "user_name"
    t.string   "address"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.string   "photo"
    t.string   "company"
    t.text     "description"
    t.integer  "rating"
    t.string   "picture"
    t.string   "name"
    t.string   "token"
    t.datetime "token_expiry"
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "categories", "materials"
  add_foreign_key "chats", "users", column: "receiver_id"
  add_foreign_key "chats", "users", column: "sender_id"
  add_foreign_key "materials", "users"
  add_foreign_key "messages", "chats"
  add_foreign_key "messages", "users"
  add_foreign_key "purchases", "materials"
  add_foreign_key "purchases", "users"
end
