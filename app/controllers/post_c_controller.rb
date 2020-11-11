class PostCController < ApplicationController
  before_action :set_post,only: [:edit,:update,:show,:destroy]
  before_action :authenticate_user!,only: [:edit,:new]

  def new
    @post = PostC.new
  end

  def create
    @post = PostC.new(post_params)
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
    @comment = CommentC.new
    @comments = @post.comment_cs.includes(:user)
  end

  def destroy
    @post.destroy
    redirect_to user_url(current_user)
  end


private

  def post_params
    params.require(:post_c).permit(:title,:image,:place,:brand,:story,:evidence,:tag_list).merge(user_id: current_user.id)
  end

  def set_post
    @post = PostC.find(params[:id])
  end

end
