class PickBsController < ApplicationController
  def create
    pick = current_user.pick_bs.build(post_b_id: params[:post_b_id])
    pick.save
    redirect_back(fallback_location: root_path)
    flash[:notice] = '投稿を「Pick」しました'
  end

  def destroy
    pick = PickB.find_by(post_b_id: params[:post_b_id], user_id: current_user.id)
    pick.destroy
    redirect_back(fallback_location: root_path)
    flash[:notice] = '投稿を「Pick」から外しました'
  end
end
