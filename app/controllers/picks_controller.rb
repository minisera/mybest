class PicksController < ApplicationController
  def create
    pick = current_user.pick_cs.build(post_c_id: params[:post_c_id])
    respond_to do |format|
      if pick.save
        @post = PostC.find(params[:post_c_id])
        format.js
      end
    end
  end

  def destroy
    pick = PickC.find_by(post_c_id: params[:post_c_id], user_id: current_user.id)
    respond_to do |format|
      if pick.destroy
        @post = PostC.find(params[:post_c_id])
        format.js
      end
    end
  end
  
end
