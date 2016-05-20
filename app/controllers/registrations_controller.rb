#Controller for creating new users
class RegistrationsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    #binding.pry
    @user = User.new(user_params)
    #This might be a vulnerability...
    @user.groups << Group.find_by(group_slug: params[:group_slug])
    if @user.save
      #binding.pry
      session[:user_id] = @user.id
      redirect_to memes_path(params[:group_slug])
    else
      error_type
      render :new
      #add in flash
    end 
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :avatar)
  end

  def error_type
    if @user.errors.messages[:password_confirmation]
      flash[:danger] = "Your passwords do not match. Please try again."
    elsif @user.errors.messages[:username]
      flash[:danger] = "#{@user.username} has already been taken. Please try another username."
      # add in flash check for password is too short
    elsif @user.errors.messages[:password]
      flash[:danger] = "Passwords must be at least 6 characters. Please try again."
    end
  end

end
