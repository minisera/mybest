class PickGsController < ApplicationController
  def create
    pick = current_user.pick_gs.build(post_g_id: params[:post_g_id])
    respond_to do |format|
      if pick.save
        @post = PostG.find(params[:post_g_id])
        format.js
      end
    end
  end

  def destroy
    pick = PickG.find_by(post_g_id: params[:post_g_id], user_id: current_user.id)
    respond_to do |format|
      if pick.destroy
        @post = PostG.find(params[:post_g_id])
        format.js
      end
    end
  end
end
