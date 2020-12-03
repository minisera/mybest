class CommentCsController < ApplicationController
  before_action :set_comment, only: :create

  def create
    @comment = CommentC.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.js
        flash[:notice] = 'コメントを投稿しました'
      end
    end
  end
  
  def destroy
    comment = CommentC.find(params[:post_c_id])
    comment.destroy
    redirect_back(fallback_location: root_path)
    flash[:notice] = 'コメントを削除しました'
  end
  
  private
  
  def comment_params
    params.require(:comment_c).permit(:text).merge(user_id: current_user.id, post_c_id: params[:post_c_id])
  end
  
  def set_comment
    @post = PostC.find(params[:post_c_id])
    @comments = @post.comment_cs.includes(:user)
  end
    
end
