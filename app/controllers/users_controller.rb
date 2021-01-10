class UsersController < ApplicationController
  include CommonActions
  
  before_action :set_user
  before_action :authenticate_user!, only: [:edit]

  def show
    @posts_pick = @user.pick_posts.includes(:like_user).with_attached_image
    posts = @user.posts.includes(:like_user,user: {profile_image_attachment: :blob}).with_attached_image
    sort_post_type(posts)
  end

  def edit
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


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :profile)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
