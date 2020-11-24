class PickCsController < ApplicationController
  def create
    pick = current_user.pick_cs.build(post_c_id: params[:post_c_id])
    pick.save
    redirect_back(fallback_location: root_path)
    flash[:notice] = '投稿を「Pick」しました'
  end

  def destroy
    pick = PickC.find_by(post_c_id: params[:post_c_id], user_id: current_user.id)
    pick.destroy
    redirect_back(fallback_location: root_path)
    flash[:notice] = '投稿を「Pick」から外しました'
  end
end
