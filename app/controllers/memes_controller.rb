class MemesController < ApplicationController
  def index
  end

  def show
    @meme = Group.find_by(group_slug: params[:group_slug]).memes.find(params[:meme_id])
    binding.pry
  end
end
