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

  def self.find_groups_for_user(user)
    #user passed in as ID
    memberships = Membership.where(user_id: user)
    group_ids = memberships.collect{|m| m.group_id}
    groups = group_ids.collect{|id| Group.find(id)}
    return groups
    #select * from groups inner join memberships where memberships.user_id == user.id
  end

  # def self.find_title(params)
  #   slug = params[:group_slug]
  #   if slug
  #     g = Group.find_by(group_slug: slug)
  #     return g.title
  #   else
  #     return " "
  #   end
  # end

end
