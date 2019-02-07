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

ActiveRecord::Schema.define(version: 20190206080807) do

  create_table "products", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                                          null: false
    t.text     "description",         limit: 65535,             null: false
    t.integer  "condition",                         default: 0, null: false
    t.integer  "size",                              default: 0
    t.integer  "select_shipping_fee",               default: 0, null: false
    t.integer  "shipping_method",                   default: 0, null: false
    t.integer  "area",                              default: 0, null: false
    t.integer  "shipping_date",                     default: 0, null: false
    t.integer  "price",                                         null: false
    t.integer  "seller_id"
    t.integer  "buyer_id"
    t.integer  "for_sale",                          default: 0, null: false
    t.integer  "deal",                              default: 0, null: false
    t.integer  "category_id",                                   null: false
    t.integer  "brand_id"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.index ["brand_id"], name: "index_products_on_brand_id", using: :btree
    t.index ["buyer_id"], name: "index_products_on_buyer_id", using: :btree
    t.index ["category_id"], name: "index_products_on_category_id", using: :btree
    t.index ["name"], name: "index_products_on_name", using: :btree
    t.index ["seller_id"], name: "index_products_on_seller_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                                default: "", null: false
    t.string   "encrypted_password",                   default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "nickname",               limit: 20,                 null: false
    t.string   "last_name",                                         null: false
    t.string   "first_name",                                        null: false
    t.string   "last_name_kana",                                    null: false
    t.string   "first_name_kana",                                   null: false
    t.string   "phone_number",                                      null: false
    t.string   "postal_code"
    t.integer  "prefecture",                           default: 0,  null: false
    t.string   "cities",                                            null: false
    t.string   "address",                                           null: false
    t.string   "building_name"
    t.datetime "birthday",                                          null: false
    t.string   "icon_image"
    t.text     "profile",                limit: 65535
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
