class BooksController < PostsController
  private

  def set_post_info
    @post_name = 'book'
  end

  def use_before_action?
    true
  end
end
