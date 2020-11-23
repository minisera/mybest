class PickBsController < ApplicationController
  def create
    pick = current_user.pick_bs.build(post_b_id: params[:post_b_id])
    pick.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    pick = PickB.find_by(post_b_id: params[:post_b_id], user_id: current_user.id)
    pick.destroy
    redirect_back(fallback_location: root_path)
  end
end
