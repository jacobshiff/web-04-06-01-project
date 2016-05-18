class MemesController < ApplicationController
  def index
    @group_slug = params[:group_slug]
    binding.pry
    @memes = Meme.where(group_slug: @group_slug)
  end

end
