class PostGController < ApplicationController
  before_action :set_post,only: [:edit,:update,:show,:destroy]
  before_action :authenticate_user!,except: [:show]
  before_action :move_to_index, only: :edit

  def new
    @post = PostG.new
  end

  def create
    @post = PostG.new(post_params)
    if @post.save
      redirect_to user_url(current_user)
    else
      render :new
    end
  end

  def edit
  end
  
  def update
    if @post.update(postc_params)
      redirect_to user_url(current_user)
    else
      render :edit
    end
  end

  def show
    @comment = CommentG.new
    @comments = @post.comment_gs.includes(:user)
  end

  def destroy
    @post.destroy
    redirect_to user_url(current_user)
  end


private

  def post_params
    params.require(:post_g).permit(:title,:image,:place,:brand,:story,:evidence,:tag_list).merge(user_id: current_user.id)
  end

  def set_post
    @post = PostG.find(params[:id])
  end

  def move_to_index
    @post = PostG.find(params[:id])
    redirect_to posts_url unless current_user == @post.user
  end
end
