ActiveRecord::Schema.define(version: 20151123134651) do

  create_table "bucketlists", force: :cascade do |t|
    t.string   "name"
    t.string   "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "bucketlists", ["created_by"], name: "index_bucketlists_on_created_by"

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.boolean  "done"
    t.integer  "bucketlist_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "auth_token"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email"

end
