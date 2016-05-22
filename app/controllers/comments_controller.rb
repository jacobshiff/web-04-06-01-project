class CommentsController < ApplicationController

  def create
  binding.pry
  @comment = Comment.new(comment_params)
  @comment.group = ____
  @comment.user = ____
  @comment.meme = _____
    if @comment.save

    end
  end

  private
  def comment_params

  end

end
