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
    @group.creator = current_user
    @group.save
  end

  private

  def group_params
    params.require(:group).permit(:title)
  end
end
