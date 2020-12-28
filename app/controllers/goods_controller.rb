class GoodsController < PostsController
  private

  def set_post_info
    @post_name = 'good'
  end

  def use_before_action?
    true
  end
end
