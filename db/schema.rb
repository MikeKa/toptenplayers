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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160409201129) do

  create_table "leagues", force: :cascade do |t|
    t.string   "name"
    t.string   "country"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "imagelink"
    t.text     "description"
    t.string   "websitelink"
  end

  create_table "playernames", force: :cascade do |t|
    t.string   "name"
    t.string   "team"
    t.string   "amplua"
    t.string   "photolink"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.integer  "golas"
    t.integer  "assists"
    t.integer  "league_id"
    t.integer  "season_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "playername_id"
  end

  add_index "players", ["league_id"], name: "index_players_on_league_id"
  add_index "players", ["playername_id"], name: "index_players_on_playername_id"
  add_index "players", ["season_id"], name: "index_players_on_season_id"

  create_table "seasons", force: :cascade do |t|
    t.string   "name"
    t.integer  "league_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "description"
  end

  add_index "seasons", ["league_id"], name: "index_seasons_on_league_id"

end
