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

ActiveRecord::Schema.define(:version => 20121030230642) do

  create_table "analyses", :force => true do |t|
    t.text     "inputs"
    t.text     "output"
    t.integer  "mind_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "hidden_neuron_layers", :force => true do |t|
    t.integer  "mind_id"
    t.integer  "neuron_count"
    t.integer  "position"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "minds", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "input_arity"
    t.integer  "output_arity"
  end

  create_table "training_data", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "mind_id"
    t.text     "input"
    t.text     "expected_output"
  end

end
