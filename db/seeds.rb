# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(name: '', )

comment_1 = Comments.create(content: 'Lollllzzzzz')
comment_2 = Comments.create(content: 'This is amazing')
comment_3 = Comments.create(content: 'Ron Paul 2012')
comment_4 = Comments.create(content: 'What is this meme?')
comment_5 = Comments.create(content: 'Haahhahaah. Amazing')

like_1 = Reactions.create(type: 'like')
like_2 = Reactions.create(type: 'like')
like_3 = Reactions.create(type: 'like')
dislike_1 = Reactions.create(type: 'dislike')
dislike_2 = Reactions.create(type: 'dislike')

tag_1 = Tags



create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "meme_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string   "title"
    t.integer  "group_creator_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "invites", force: :cascade do |t|
    t.integer  "inviter_id"
    t.integer  "invitee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "memberships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.string   "user_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meme_tags", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "meme_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "memes", force: :cascade do |t|
    t.string   "file_name"
    t.integer  "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reactions", force: :cascade do |t|
    t.integer  "meme_id"
    t.integer  "user_id"
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end
