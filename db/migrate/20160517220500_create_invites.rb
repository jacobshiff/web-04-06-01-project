class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.string :inviter_id,
      t.string :invitee_id,
      t.timestamps null: false
    end
  end
end
