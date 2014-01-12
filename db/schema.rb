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

ActiveRecord::Schema.define(:version => 20140105123031) do

  create_table "learning_histories", :force => true do |t|
    t.string   "learner_id"
    t.string   "learning_date"
    t.string   "test_category_id"
    t.integer  "problem_no"
    t.integer  "item_number"
    t.string   "answer_content"
    t.integer  "judgement_result"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "problems", :force => true do |t|
    t.string   "test_category_id",  :null => false
    t.integer  "problem_no"
    t.string   "problem_content"
    t.string   "model_answer"
    t.string   "commentary"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "answer_candidate1"
    t.string   "answer_candidate2"
    t.string   "answer_candidate3"
    t.string   "answer_candidate4"
  end

  create_table "test_categories", :force => true do |t|
    t.string   "test_category_id"
    t.string   "test_category_content"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "user_id"
    t.string   "user_name"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
