class PickBsController < ApplicationController
  def create
    pick = current_user.pick_bs.build(post_b_id: params[:post_b_id])
    respond_to do |format|
      if pick.save
        @post = PostB.find(params[:post_b_id])
        format.js
      end
    end
  end

  def destroy
    pick = PickB.find_by(post_b_id: params[:post_b_id], user_id: current_user.id)
    respond_to do |format|
      if pick.destroy
        @post = PostB.find(params[:post_b_id])
        format.js
      end
    end
  end
end
