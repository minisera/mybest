class CommentBsController < ApplicationController
  def create
    @comment = CommentB.create(comment_params)
    redirect_back(fallback_location: root_path)
    flash[:notice] = '投稿にコメントしました'
  end

  def destroy
    comment = CommentB.find(params[:post_b_id])
    comment.destroy
    redirect_back(fallback_location: root_path)
    flash[:notice] = 'コメントを削除しました'
  end

  private

  def comment_params
    params.require(:comment_b).permit(:text).merge(user_id: current_user.id, post_b_id: params[:post_b_id])
  end
end
