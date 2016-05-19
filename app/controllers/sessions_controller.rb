# Controller for logging in users
class SessionsController < ApplicationController

  def new
    # This is the action associated with logging in (get request)

  end

  def create
    # This is the action associated with logging in (post request)
    # This finds the user id and adds it to his/her cookie

#    @user = User.find(params[:user][:id])
    @user = User.find_by(username: user_params[:username])
    if @user.authenticate(user_params[:password])
      binding.pry
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

  private
 	def user_params
     params.require(:user).permit(:username, :password)
 	end

end
