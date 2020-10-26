class PostCController < ApplicationController
  def new
    @post_c = PostC.new
  end

  def create
    @post_c = PostC.new(postc_params)
    if @post_c.save
      redirect_to user_url(current_user.id)
    else
      render :new
    end
  end

  def index
    
  end

  def show
    
  end

private

  def postc_params
    params.require(:post_c).permit(:title,:image,:place,:brand,:story,:evidence).merge(user_id: current_user.id)
  end

end
