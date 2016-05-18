class Group < ActiveRecord::Base
  has_many :memberships
  has_many :users, through: :memberships
  has_many :memes
  belongs_to :group_creator, class_name: 'User'
end
