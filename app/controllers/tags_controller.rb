class TagsController < ApplicationController
  def index
    @posts = PostB.tagged_with(params[:tag])
    @tags = PostB.tag_counts_on(:tags).order("count DESC")
    @tag = params[:tag]
  end
end
