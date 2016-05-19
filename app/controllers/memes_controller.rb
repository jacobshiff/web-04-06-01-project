class MemesController < ApplicationController
  before_action :require_login_and_access
  def index
    #binding.pry
    group_slug = params[:group_slug]
    @group = Group.find_by(group_slug: group_slug)
    @memes = Meme.where(group: @group)
  end

  def show
    @meme = Group.find_by(group_slug: params[:group_slug]).memes.find(params[:id])
  end

end
