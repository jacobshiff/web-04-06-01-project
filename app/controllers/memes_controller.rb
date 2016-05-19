class MemesController < ApplicationController
    before_action :find_group, only: [:index, :show, :new, :create]

  def index
    #binding.pry
    # group_slug = params[:group_slug]
    # @group = Group.find_by(group_slug: group_slug)
    @memes = Meme.where(group: @group)
  end

  def show
    @meme = @group.memes.find(params[:id])
  end

  def new
    @meme = Meme.new
  end

  def create
    @meme = Meme.create(meme_params)
    redirect_to meme_path
  end


  private
  def find_group
    @group = Group.find_by(group_slug: params[:group_slug])
  end

  def meme_params
    params.require(:meme).permit(:file_name)
  end

end
