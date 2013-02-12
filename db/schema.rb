# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130211225956) do

  create_table "pledges", :force => true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.integer  "amount"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "pledges", ["project_id"], :name => "index_pledges_on_project_id"
  add_index "pledges", ["user_id"], :name => "index_pledges_on_user_id"

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.string   "teaser"
    t.integer  "user_id"
    t.text     "description"
    t.integer  "goal"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "projects", ["user_id"], :name => "index_projects_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",            :null => false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

end
