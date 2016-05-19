class MemesController < ApplicationController
  before_action :set_meme, only: [:show, :destroy]

  def index
    #binding.pry
    group_slug = params[:group_slug]
    @group = Group.find_by(group_slug: group_slug)
    @memes = Meme.where(group: @group)
  end

  def show
  end

  def destroy
    @meme.destroy
    redirect_to memes_path(@meme.group.group_slug)
  end

  private
  def set_meme
    @meme = Group.find_by(group_slug: params[:group_slug]).memes.find(params[:id])
  end

end
