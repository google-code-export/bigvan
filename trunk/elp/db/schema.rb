# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 8) do

  create_table "accounts", :force => true do |t|
    t.string   "user_name",     :null => false
    t.datetime "last_login_dt", :null => false
    t.datetime "create_dt",     :null => false
    t.integer  "level",         :null => false
    t.text     "description"
  end

  create_table "menus", :force => true do |t|
    t.integer  "parent_id"
    t.string   "shortname",   :null => false
    t.string   "longname"
    t.string   "controller"
    t.string   "action"
    t.string   "parameters"
    t.text     "description"
    t.datetime "create_dt",   :null => false
    t.integer  "level",       :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "author"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", :force => true do |t|
    t.string  "tag_name"
    t.integer "post_id"
  end

  create_table "wikis", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_news",    :default => false
    t.boolean  "is_rdoc",    :default => false
  end

end
