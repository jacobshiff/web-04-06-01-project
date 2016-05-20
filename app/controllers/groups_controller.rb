class GroupsController < ApplicationController
  before_action :current_user

  def index
    #binding.pry
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
    @group.group_creator = current_user
    @group.users << current_user
    @group.group_slug = @group.to_slug
    #binding.pry
    @group.save
    redirect_to group_path(@group.group_slug)
  end

  private

  def group_params
    params.require(:group).permit(:title)
  end
end
