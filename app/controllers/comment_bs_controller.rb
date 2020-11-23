class CommentBsController < ApplicationController
  def create
    @comment = CommentB.create(comment_params)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    comment = CommentB.find(params[:post_b_id])
    comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment_b).permit(:text).merge(user_id: current_user.id, post_b_id: params[:post_b_id])
  end
end
