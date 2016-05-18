class MemesController < ApplicationController
  def index
    #binding.pry
    group_slug = params[:group_slug]
    @group = Group.where(group_slug: group_slug)
    @memes = Meme.where(group: @group)
  end

end
