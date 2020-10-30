class PostCController < ApplicationController
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
    @post_c = PostC.find(params[:id])
  end
  
  def update
    @post_c = PostC.find(params[:id])
    if @post_c.update(postc_params)
      redirect_to user_url(current_user)
    else
      render :edit
    end
  end

  def show
    @post_c = PostC.find(params[:id])
  end

  def destroy
    @post_c = PostC.find(params[:id])
    @post_c.destroy
    redirect_to user_url(current_user)
  end


private

  def postc_params
    params.require(:post_c).permit(:title,:image,:place,:brand,:story,:evidence).merge(user_id: current_user.id)
  end

end
