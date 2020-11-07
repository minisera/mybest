class LikeBsController < ApplicationController
  def create
    like = current_user.like_bs.build(post_b_id: params[:post_b_id])
    like.save
    redirect_back(fallback_location: root_path)
  end
  def destroy
    like = LikeB.find_by(post_b_id: params[:post_b_id],user_id: current_user.id)
    like.destroy
    redirect_back(fallback_location: root_path)
  end
end