class GroupsController < ApplicationController
  before_action :current_user
  #before_action :require_login_and_access

  def index
    @groups = Group.find_groups_for_user(current_user)
  end

  def show
    @group = Group.find_by(group_slug: params[:group_slug])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.group_slug = @group.to_slug
    @group.group_creator = current_user
    @group.save
    Membership.create(group: @group, user: current_user, user_type: "admin")
    redirect_to group_path(@group.group_slug)
  end

  private

  def group_params
    params.require(:group).permit(:title)
  end
end
