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

ActiveRecord::Schema.define(version: 2018_05_28_043937) do

  create_table "foreigners", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.bigint "uid"
    t.string "provider"
    t.integer "j_l", limit: 1
    t.integer "gender", limit: 1
    t.text "intro"
    t.string "image"
    t.date "birthday"
    t.integer "nation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_foreigners_on_confirmation_token", unique: true
    t.index ["email"], name: "index_foreigners_on_email", unique: true
    t.index ["nation_id"], name: "index_foreigners_on_nation_id"
    t.index ["reset_password_token"], name: "index_foreigners_on_reset_password_token", unique: true
  end

  create_table "japaneses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "first_name"
    t.string "last_name"
    t.integer "gender", limit: 1
    t.date "birthday"
    t.string "image"
    t.text "intro"
    t.integer "lang_l"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_japaneses_on_confirmation_token", unique: true
    t.index ["email"], name: "index_japaneses_on_email", unique: true
    t.index ["first_name"], name: "index_japaneses_on_first_name"
    t.index ["last_name"], name: "index_japaneses_on_last_name"
    t.index ["reset_password_token"], name: "index_japaneses_on_reset_password_token", unique: true
  end

  create_table "matches", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "meal_id"
    t.bigint "japanese_id"
    t.boolean "ok", default: false
    t.integer "budget", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["japanese_id"], name: "index_matches_on_japanese_id"
    t.index ["meal_id", "japanese_id"], name: "index_matches_on_meal_id_and_japanese_id", unique: true
    t.index ["meal_id"], name: "index_matches_on_meal_id"
  end

  create_table "meals", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "date_time"
    t.integer "location"
    t.integer "p_num", null: false
    t.integer "lang"
    t.bigint "foreigner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["foreigner_id"], name: "index_meals_on_foreigner_id"
  end

  create_table "messages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "flag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rooms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "match_id", null: false
    t.bigint "foreigner_id", null: false
    t.bigint "japanese_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["foreigner_id"], name: "index_rooms_on_foreigner_id"
    t.index ["japanese_id"], name: "index_rooms_on_japanese_id"
    t.index ["match_id"], name: "index_rooms_on_match_id", unique: true
  end

  add_foreign_key "matches", "japaneses"
  add_foreign_key "matches", "meals"
  add_foreign_key "rooms", "foreigners"
  add_foreign_key "rooms", "japaneses"
  add_foreign_key "rooms", "matches"
end
