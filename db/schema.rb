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

ActiveRecord::Schema.define(version: 2018_07_02_202424) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "emotions", force: :cascade do |t|
    t.decimal "timeStamp"
    t.integer "facesCount"
    t.jsonb "appearance"
    t.jsonb "emotions"
    t.jsonb "expressions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "video_id"
  end

  create_table "face_video_analyses", force: :cascade do |t|
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end