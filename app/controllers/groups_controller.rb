class GroupsController < ApplicationController
  before_action :current_user

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
    #binding.pry
    @group.save
    @group.users << current_user
    redirect_to group_path(@group.group_slug)
  end

  private

  def group_params
    params.require(:group).permit(:title)
  end
end
