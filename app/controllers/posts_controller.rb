class PostsController < ApplicationController
  def index
    @post_cs = PostC.includes(:user).order("created_at DESC").page(params[:page]).per(9)
    @post_bs = PostB.includes(:user).order("created_at DESC").page(params[:page]).per(9)
    @post_gs = PostG.includes(:user).order("created_at DESC").page(params[:page]).per(9)
    @tag_cs = PostC.tag_counts_on(:tags).most_used(10) 
    @tag_bs = PostB.tag_counts_on(:tags).most_used(10) 
    @tag_gs = PostG.tag_counts_on(:tags).most_used(10) 
  end

  def trend_index
    @post_c_ranks = PostC.find(LikeC.group(:post_c_id).order("count(post_c_id) desc").pluck(:post_c_id))
    @post_b_ranks = PostB.find(LikeB.group(:post_b_id).order("count(post_b_id) desc").pluck(:post_b_id))
    @post_g_ranks = PostG.find(LikeG.group(:post_g_id).order("count(post_g_id) desc").pluck(:post_g_id))
    @tag_cs = PostC.tag_counts_on(:tags).most_used(10) 
    @tag_bs = PostB.tag_counts_on(:tags).most_used(10) 
    @tag_gs = PostG.tag_counts_on(:tags).most_used(10) 
  end

  def about
    
  end

end
