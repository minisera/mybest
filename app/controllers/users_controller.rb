class UsersController < ApplicationController
  before_action :set_user,only: [:show,:follows,:followers]

  def show
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to user_url(current_user)
    else
      render :edit
    end
  end

  def follows
    @users = @user.followings
  end
  
  def followers
    @users = @user.followers
  end

private
  def user_params
    params.require(:user).permit(:name,:profile_image)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
end
