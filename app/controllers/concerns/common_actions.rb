module CommonActions
  extend ActiveSupport::Concern

  def post_update 
    if @post.update(post_params)
      redirect_to user_url(current_user), notice: 'お気に入りを編集しました'
    else
      render :edit
    end
  end

  def post_destroy
    @post.destroy
    redirect_to user_url(current_user), notice: 'お気に入りを削除しました'
  end

  def post_save
    if @post.save
      redirect_to user_url(current_user), notice: 'お気に入りを登録しました'
    else
      render :new
    end
  end
end
