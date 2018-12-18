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

ActiveRecord::Schema.define(version: 2018_12_18_133605) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cases", force: :cascade do |t|
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "enabled", default: true
  end

  create_table "criminals", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "emotions", force: :cascade do |t|
    t.decimal "timeStamp"
    t.integer "facesCount"
    t.jsonb "appearance"
    t.jsonb "emotions"
    t.jsonb "expressions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "video_id"
    t.jsonb "measurements"
    t.jsonb "featurePoints"
  end

  create_table "face_video_analyses", force: :cascade do |t|
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "video_base64"
    t.bigint "case_id"
    t.bigint "criminal_id"
    t.boolean "enabled", default: true
    t.text "average_age"
    t.text "average_gender"
    t.text "dominant_emotion"
    t.text "emotion_trend"
    t.text "emotions_percentage", default: [], array: true
    t.text "notable_moments", default: [], array: true
    t.text "duration"
    t.text "lesser_emotion"
    t.string "logs", default: [], array: true
    t.string "rating"
    t.index ["case_id"], name: "index_face_video_analyses_on_case_id"
    t.index ["criminal_id"], name: "index_face_video_analyses_on_criminal_id"
  end

  create_table "markers", force: :cascade do |t|
    t.text "text"
    t.decimal "time"
    t.bigint "face_video_analysis_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["face_video_analysis_id"], name: "index_markers_on_face_video_analysis_id"
  end

  create_table "settings", force: :cascade do |t|
    t.boolean "joy_enabled"
    t.boolean "sadness_enabled"
    t.boolean "anger_enabled"
    t.boolean "fear_enabled"
    t.boolean "surprise_enabled"
    t.boolean "contempt_enabled"
    t.boolean "disgust_enabled"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "markers", "face_video_analyses"
end
