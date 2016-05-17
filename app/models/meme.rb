class Meme < ActiveRecord::Base
  belongs to :creator, class_name: ‘User’
  has_many :likes
  has_many :comments
  has_many :meme_tags
  has_many :tags, through: :meme_tags
end
