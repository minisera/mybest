class PostCController < ApplicationController
  before_action :set_post_c,only: [:edit,:update,:show,:destroy]

  def new
    @post_c = PostC.new
  end

  def create
    @post_c = PostC.new(postc_params)
    if @post_c.save
      redirect_to user_url(current_user)
    else
      render :new
    end
  end

  def edit
  end
  
  def update
    if @post_c.update(postc_params)
      redirect_to user_url(current_user)
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @post_c.destroy
    redirect_to user_url(current_user)
  end


private

  def postc_params
    params.require(:post_c).permit(:title,:image,:place,:brand,:story,:evidence).merge(user_id: current_user.id)
  end

  def set_post_c
    @post_c = PostC.find(params[:id])
  end

end
