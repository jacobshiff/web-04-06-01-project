class GroupsController < ApplicationController
  before_action :current_user

  def index
    #binding.pry
    @groups = Group.find_groups_for_user(current_user)
  end

  def show
    @group = Group.find_by(group_slug: params[:group_slug])
  end

end
