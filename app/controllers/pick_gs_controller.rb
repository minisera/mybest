class PickGsController < ApplicationController
  def create
    pick = current_user.pick_gs.build(post_g_id: params[:post_g_id])
    pick.save
    redirect_back(fallback_location: root_path)
  end
  def destroy
    pick = PickG.find_by(post_g_id: params[:post_g_id],user_id: current_user.id)
    pick.destroy
    redirect_back(fallback_location: root_path)
  end
end
