class Comment < ActiveRecord::Base
  #relationships here
  belongs_to :user
  belongs_to :meme
end
