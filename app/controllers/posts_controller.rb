class PostsController < ApplicationController
  def index
    @post_cs = PostC.includes(:user).order("created_at DESC")
    @post_bs = PostB.includes(:user).order("created_at DESC")
    @post_gs = PostG.includes(:user).order("created_at DESC")
    @tag_cs = PostC.tag_counts_on(:tags).most_used(10) 
    @tag_bs = PostB.tag_counts_on(:tags).most_used(10) 
    @tag_gs = PostG.tag_counts_on(:tags).most_used(10) 
  end

  def trend_index
    @post_c_ranks = PostC.find(LikeC.group(:post_c_id).order("count(post_c_id) desc").pluck(:post_c_id))
  end

end
