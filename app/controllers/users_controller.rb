class UsersController < ApplicationController
  before_action :set_user
  before_action :authenticate_user!, only: [:edit]

  def show
    posts = @user.posts.with_attached_image
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
  
  def sort_post_type(posts)
    @posts_b = posts.select { |x| x[:type].include?('Book') }.take(9)
    @posts_c = posts.select { |x| x[:type].include?('Clothe') }.take(9)
    @posts_g = posts.select { |x| x[:type].include?('Good') }.take(9)
  end

end
