class CreateMemeTags < ActiveRecord::Migration
  def change
    create_table :meme_tags do |t|

      t.timestamps null: false
    end
  end
end
