class MemesController < ApplicationController
  def index
    #binding.pry
    group_slug = params[:group_slug]
    @group = Group.where(group_slug: group_slug)
    @memes = Meme.where(group: @group)
  end

  def show
    @meme = Group.find_by(group_slug: params[:group_slug]).memes.find(params[:id])
  end

end
