class PostBController < ApplicationController
  before_action :set_post_b,only: [:edit,:update,:show,:destroy]

  def new
    @post_b = PostB.new
  end

  def create
    @post_b = PostB.new(postc_params)
    if @post_b.save
      redirect_to user_url(current_user)
    else
      render :new
    end
  end

  def edit
  end
  
  def update
    if @post_b.update(postc_params)
      redirect_to user_url(current_user)
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @post_b.destroy
    redirect_to user_url(current_user)
  end


private

  def postc_params
    params.require(:post_b).permit(:title,:image,:place,:brand,:story,:evidence).merge(user_id: current_user.id)
  end

  def set_post_b
    @post_b = PostB.find(params[:id])
  end
end
