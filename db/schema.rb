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

ActiveRecord::Schema.define(version: 2021_09_22_133304) do

  create_table "nouns", force: :cascade do |t|
    t.string "name"
    t.string "s_name"
    t.string "description"
    t.string "en_name"
    t.string "en_s_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "records", force: :cascade do |t|
    t.string "operation"
    t.string "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "noun_id", null: false
    t.index ["noun_id"], name: "index_records_on_noun_id"
  end

  create_table "reference_relations", force: :cascade do |t|
    t.bigint "quoter_id"
    t.string "quoter_type"
    t.bigint "reference_id"
    t.string "reference_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["quoter_id", "quoter_type"], name: "index_reference_relations_on_quoter_id_and_quoter_type"
    t.index ["reference_id", "reference_type"], name: "index_reference_relations_on_reference_id_and_reference_type"
  end

  create_table "relatables", id: false, force: :cascade do |t|
    t.string "relatable_type"
    t.integer "relatable_id"
    t.string "master_type"
    t.integer "master_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["master_type", "master_id"], name: "index_relatables_on_master"
    t.index ["relatable_type", "relatable_id"], name: "index_relatables_on_relatable"
  end

  create_table "search_counters", force: :cascade do |t|
    t.integer "count"
    t.integer "countable_id"
    t.string "countable_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["countable_id", "countable_type"], name: "index_search_counters_on_countable_id_and_countable_type"
  end

  add_foreign_key "records", "nouns"
end
