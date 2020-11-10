class CommentGsController < ApplicationController
  def create
    @comment = CommentG.create(comment_params)
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    comment = CommentG.find(params[:post_g_id])
    comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def comment_params
    params.require(:comment_g).permit(:text).merge(user_id: current_user.id, post_g_id: params[:post_g_id])
  end
end
