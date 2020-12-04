class LikeBsController < ApplicationController
  def create
    like = current_user.like_bs.build(post_b_id: params[:post_b_id])
    respond_to do |format|
      if like.save
        @post = PostB.find(params[:post_b_id])
        format.js
      end
    end
  end

  def destroy
    like = LikeB.find_by(post_b_id: params[:post_b_id], user_id: current_user.id)
    respond_to do |format|
      if like.destroy
        @post = PostB.find(params[:post_b_id])
        format.js
      end
    end
  end
end
