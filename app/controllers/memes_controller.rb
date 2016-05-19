class MemesController < ApplicationController
    before_action :set_group, only: [:index, :new]
    before_action :set_meme, only: [:show, :destroy]

  def index
    #binding.pry
    # group_slug = params[:group_slug]
    # @group = Group.find_by(group_slug: group_slug)
    @memes = Meme.where(group: @group)
  end

  def show
  end


  def new
    @meme = Meme.new
  end

  def destroy
    @meme.destroy
    redirect_to memes_path(@meme.group.group_slug)
  end

  def create
    @meme = Meme.new(meme_params)
    @meme.group = Group.find_by(group_slug: params[:group_slug])
    @meme.creator = User.find_by(username: 'rachelb') # CHANGE THIS AFTER USERS EXIST
    if @meme.save
      redirect_to meme_path(group_slug: @meme.group.group_slug, id: @meme.id)
    else
      render :new
    end
  end

  private
  def set_meme
    @meme = Group.find_by(group_slug: params[:group_slug]).memes.find(params[:id])
  end

  def set_group
    @group = Group.find_by(group_slug: params[:group_slug])
  end

  def meme_params
    params.require(:meme).permit(:image, :file_name)
  end

end
