class CommentsController < ApplicationController
  before_action :set_comment, only: :create

  def create
    @comment = Comment.new(comment_params)
    respond_to do |format|
      format.js if @comment.save
    end
  end

  def destroy
    comment = Comment.find(params[:post_id])
    comment.destroy
    redirect_back(fallback_location: root_path)
    flash[:notice] = 'コメントを削除しました'
  end

  private

  def comment_params
    params.permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end

  def set_comment
    @post = Post.find(params[:post_id])
    @comments = @post.comments
  end
end
