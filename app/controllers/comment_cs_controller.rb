class CommentCsController < ApplicationController
  def create
    @comment = CommentC.new(comment_params)
    @comment.save
    redirect_back(fallback_location: root_path)
    
    #   respond_to do | format |
    #     format.json
    #   end
    # else
    #   # render post_c_path(@comment.post_c.id)
    # # flash[:notice] = '投稿にコメントしました'
    # end
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
end
