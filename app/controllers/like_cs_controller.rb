class LikeCsController < ApplicationController
  def create
    like = current_user.like_cs.build(post_c_id: params[:post_c_id])
    respond_to do |format|
      if like.save
        @post = PostC.find(params[:post_c_id])
        format.js
      end
    end
  end

  def destroy
    like = LikeC.find_by(post_c_id: params[:post_c_id], user_id: current_user.id)
    respond_to do |format|
      if like.destroy
        @post = PostC.find(params[:post_c_id])
        format.js
      end
    end
  end
end
