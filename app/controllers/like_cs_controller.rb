class LikeCsController < ApplicationController
  def create
    like = current_user.like_cs.build(post_c_id: params[:post_c_id])
    like.save
    redirect_back(fallback_location: root_path)
    flash[:notice] = '投稿に「いいね」しました'
  end

  def destroy
    like = LikeC.find_by(post_c_id: params[:post_c_id], user_id: current_user.id)
    like.destroy
    redirect_back(fallback_location: root_path)
    flash[:notice] = '投稿から「いいね」を外しました'
  end
end
