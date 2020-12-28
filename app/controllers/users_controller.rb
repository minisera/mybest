class UsersController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!, only: [:edit]

  def show
  end

  def edit
    @user = User.find(params[:id])
    unless current_user == @user
      redirect_to posts_url
      flash[:alert] = '他人の情報は編集できません'
    end
  end

  def update
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

  def show_pick
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :profile)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
