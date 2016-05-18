class Meme < ActiveRecord::Base
  belongs_to :creator, class_name: 'User'
  has_many :likes
  has_many :comments
  has_many :meme_tags
  has_many :tags, through: :meme_tags
  has_many :reactions
  belongs_to :group
end
