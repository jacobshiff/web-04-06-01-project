class UsersController < ApplicationController
  def show
    binding.pry
    @user = User.find(params[:user_id])
  end
end
