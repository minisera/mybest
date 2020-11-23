class TagsController < ApplicationController
  def index
    @post_cs = PostC.tagged_with(params[:tag])
    @post_bs = PostB.tagged_with(params[:tag])
    @post_gs = PostG.tagged_with(params[:tag])
    @tag_cs = PostC.tag_counts_on(:tags).most_used(10)
    @tag_bs = PostB.tag_counts_on(:tags).most_used(10)
    @tag_gs = PostG.tag_counts_on(:tags).most_used(10)
    @tag = params[:tag]
  end
end
