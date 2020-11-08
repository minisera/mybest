class PostsController < ApplicationController
  def index
    @post_cs = PostC.includes(:user).order("created_at DESC")
    @post_bs = PostB.includes(:user).order("created_at DESC")
    @post_gs = PostG.includes(:user).order("created_at DESC")
    @tags = PostB.tag_counts_on(:tags).order("count DESC")
  end

  def trend_index
    @post_c_ranks = PostC.find(LikeC.group(:post_c_id).order("count(post_c_id) desc").pluck(:post_c_id))
  end

end
