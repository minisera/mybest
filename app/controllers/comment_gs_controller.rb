class CommentGsController < ApplicationController
  before_action :set_comment, only: :create

  def create
    @comment = CommentG.create(comment_params)
    respond_to do |format|
      if @comment.save
        format.js
      end
    end
  end

  def destroy
    comment = CommentG.find(params[:post_g_id])
    comment.destroy
    redirect_back(fallback_location: root_path)
    flash[:notice] = 'コメントを削除しました'
  end

  private

  def comment_params
    params.require(:comment_g).permit(:text).merge(user_id: current_user.id, post_g_id: params[:post_g_id])
  end

  def set_comment
    @post = PostG.find(params[:post_g_id])
    @comments = @post.comment_gs.includes(:user)
  end
end
