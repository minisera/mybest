class PostGController < ApplicationController
  before_action :set_post,only: [:edit,:update,:show,:destroy]

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
end
