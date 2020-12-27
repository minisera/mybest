class TagsController < ApplicationController
  # include CommonActions
  before_action :set_tag
  def index
    @posts = Post.tagged_with(params[:tag])
    @tag = params[:tag]
  end

  private

  def set_tag
    @tag_cs = Clothe.tag_counts_on(:tags).most_used(10)
    @tag_bs = Book.tag_counts_on(:tags).most_used(10)
    @tag_gs = Good.tag_counts_on(:tags).most_used(10)
  end
end
