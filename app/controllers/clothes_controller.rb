class ClothesController < PostsController
  private

  def set_post_info
    @post_name = 'clothe'
  end

  def use_before_action?
    true
  end
end
