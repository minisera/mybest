class LikeGsController < ApplicationController
  def create
    like = current_user.like_gs.build(post_g_id: params[:post_g_id])
    like.save
    redirect_to root_url
  end
  def destroy
    like = LikeC.find_gy(post_g_id: params[:post_g_id],user_id: current_user.id)
    like.destroy
    redirect_to root_url
  end
end
