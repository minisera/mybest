class LikesController < ApplicationController
  def create
    like = current_user.like_gs.build(post_g_id: params[:post_g_id])
    respond_to do |format|
      if like.save
        @post = PostG.find(params[:post_g_id])
        format.js
      end
    end
  end

  def destroy
    like = LikeG.find_by(post_g_id: params[:post_g_id], user_id: current_user.id)
    respond_to do |format|
      if like.destroy
        @post = PostG.find(params[:post_g_id])
        format.js
      end
    end
  end

end
