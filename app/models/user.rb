class User < ActiveRecord::Base
  has_many :memberships
  has_many :groups, through: :memberships
  has_many :likes
  has_many :comments
  has_many :memes, foreign_key: 'creator_id'
  has_many :invites, foreign_key: 'inviter_id'
  has_many :invites, foreign_key: 'invitee_id'
end
