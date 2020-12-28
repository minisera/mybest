class PicksController < ApplicationController
  def create
    pick = current_user.picks.build(post_id: params[:post_id])
    respond_to do |format|
      if pick.save
        @post = Post.find(params[:post_id])
        format.js
      end
    end
  end

  def destroy
    pick = Pick.find_by(post_id: params[:post_id], user_id: current_user.id)
    respond_to do |format|
      if pick.destroy
        @post = Post.find(params[:post_id])
        format.js
      end
    end
  end
end
