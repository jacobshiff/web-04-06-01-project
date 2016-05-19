class Group < ActiveRecord::Base
  has_many :memberships
  has_many :users, through: :memberships
  has_many :memes
  belongs_to :group_creator, class_name: 'User'

  def to_slug
    rev = self.name.downcase.tr("()&.*',+", ' ')
    ary = rev.split(" ")
    slug = ary.join("-")
    self.save(group_slug: slug)
  end

end
