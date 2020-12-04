class PostsController < ApplicationController
  include CommonActions

  before_action :authenticate_user!, except: [:about, :index, :trend_index]
  before_action :set_tag, only: [:index, :trend_index]

  def index
    @post_cs = PostC.includes(:user).order('created_at DESC').limit(9)
    @post_bs = PostB.includes(:user).order('created_at DESC').limit(9)
    @post_gs = PostG.includes(:user).order('created_at DESC').limit(9)
  end

  def trend_index
    @post_c_ranks = PostC.find(LikeC.group(:post_c_id).order('count(post_c_id) desc').pluck(:post_c_id))
    @post_b_ranks = PostB.find(LikeB.group(:post_b_id).order('count(post_b_id) desc').pluck(:post_b_id))
    @post_g_ranks = PostG.find(LikeG.group(:post_g_id).order('count(post_g_id) desc').pluck(:post_g_id))
  end

  def about
  end

end
