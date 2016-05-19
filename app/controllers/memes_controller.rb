class MemesController < ApplicationController
    before_action :find_group, only: [:index, :new]

  def index
    #binding.pry
    # group_slug = params[:group_slug]
    # @group = Group.find_by(group_slug: group_slug)
    @memes = Meme.where(group: @group)
  end

  def show
    @meme = Group.find_by(group_slug: params[:group_slug]).memes.find(params[:id])
  end

  def new
    @meme = Meme.new
  end

  def create
    @meme = Meme.new(meme_params)
    @meme.group = Group.find_by(group_slug: params[:group_slug])

    # CHANGE THIS AFTER USERS EXIST
    @meme.creator = User.find_by(username: 'rachelb')
    if @meme.save
      redirect_to meme_path(group_slug: @meme.group.group_slug, id: @meme.id)
    else
      render :new
    end
  end




  private
  def find_group
    @group = Group.find_by(group_slug: params[:group_slug])
  end

  def meme_params
    params.require(:meme).permit(:image, :file_name)
  end

end
