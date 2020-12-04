module CommonActions
  extend ActiveSupport::Concern
  def set_tag
    @tag_cs = PostC.tag_counts_on(:tags).most_used(10)
    @tag_bs = PostB.tag_counts_on(:tags).most_used(10)
    @tag_gs = PostG.tag_counts_on(:tags).most_used(10)
  end

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
