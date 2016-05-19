class User < ActiveRecord::Base
  has_many :memberships
  has_many :groups, through: :memberships
  has_many :reactions
  has_many :comments
  has_many :memes, foreign_key: 'creator_id'
  has_many :sent_invites, class_name: 'Invite', foreign_key: 'inviter_id'
  has_many :received_invites, class_name: 'Invite', foreign_key: 'invitee_id'
  has_many :created_groups, class_name: 'Group', foreign_key: 'group_creator_id'

  has_secure_password

  # Validations
  validates :username, uniqueness: true
  validates :username, :password, presence: true
  validates :password, length: { in: 6..100 }

end
