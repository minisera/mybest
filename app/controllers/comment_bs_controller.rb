class CommentBsController < ApplicationController
  before_action :set_comment, only: :create

  def create
    @comment = CommentB.create(comment_params)
    respond_to do |format|
      if @comment.save
        format.js
      end
    end
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

  def set_comment
    @post = PostB.find(params[:post_b_id])
    @comments = @post.comment_bs.includes(:user)
  end
end
