class PostGController < ApplicationController
  before_action :set_post_g,only: [:edit,:update,:show,:destroy]

  def new
    @post_g = PostG.new
  end

  def create
    @post_g = PostG.new(postc_params)
    if @post_g.save
      redirect_to user_url(current_user)
    else
      render :new
    end
  end

  def edit
  end
  
  def update
    if @post_g.update(postc_params)
      redirect_to user_url(current_user)
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @post_g.destroy
    redirect_to user_url(current_user)
  end


private

  def postc_params
    params.require(:post_g).permit(:title,:image,:place,:brand,:story,:evidence).merge(user_id: current_user.id)
  end

  def set_post_g
    @post_g = PostG.find(params[:id])
  end

end
