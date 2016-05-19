class Meme < ActiveRecord::Base
  belongs_to :creator, class_name: 'User'
  has_many :likes
  has_many :comments
  has_many :meme_tags
  has_many :tags, through: :meme_tags
  has_many :reactions
  belongs_to :group

  #paperclip validations; must include for upload
  has_attached_file :image
  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  # 
  # def file_name=(file_name)
  #   self.file_name = "#{self.image_file_name}-#{self.id}"
  # end
  #
  # def file_name
  #   self.file_name
  # end

end
