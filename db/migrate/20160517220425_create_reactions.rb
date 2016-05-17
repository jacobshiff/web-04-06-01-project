class CreateReactions < ActiveRecord::Migration
  def change
    create_table :reactions do |t|
      t.string :meme_id,
      t.string :user_id,
      t.string :type, #(like or dislike)
      t.timestamps null: false
    end
  end
end
