class UsersController < ApplicationController

  def new
    @user = User.new
    if current_user
      redirect_to users_path
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to users_path
      flash[:notice]= "login successful"
    else
      render "new"
    end
  end

  def show
    @photos = current_user.photos
    @tag = Tag.new

  end

private
 def user_params
   params.require(:user).permit(:email, :password, :password_confirmation)
 end

end
