class MemesController < ApplicationController
  before_action :require_login_and_access
  before_action :set_meme, only: [:show, :destroy, :react]

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

  def react
    @meme.update_reactions(current_user)
    @current_user = current_user

    respond_to do |format|
      format.js
    end
  end

  private
  def set_meme
    @meme = Group.find_by(group_slug: params[:group_slug]).memes.find(params[:id])
  end

end
