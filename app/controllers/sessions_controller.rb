class SessionsController < ApplicationController

  def new
    # This is the action associated with logging in (get request)
  end

  def create
    # This is the action associated with logging in (post request)
    # This finds the user id and adds it to his/her cookie

    @user = User.find(params[:user][:id])
    if @user
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to signin_path, notice: "Bad login"
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end
end
