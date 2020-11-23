class CommentCsController < ApplicationController
  def create
    @comment = CommentC.create(comment_params)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    comment = CommentC.find(params[:post_c_id])
    comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment_c).permit(:text).merge(user_id: current_user.id, post_c_id: params[:post_c_id])
  end
end
