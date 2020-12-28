class LikesController < ApplicationController
  def create
    like = current_user.likes.build(post_id: params[:post_id])
    respond_to do |format|
      if like.save
        @post = Post.find(params[:post_id])
        format.js
      end
    end
  end

  def destroy
    like = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
    respond_to do |format|
      if like.destroy
        @post = Post.find(params[:post_id])
        format.js
      end
    end
  end
end
