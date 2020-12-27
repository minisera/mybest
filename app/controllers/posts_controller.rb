class PostsController < ApplicationController
  # include CommonActions

  # before_action :authenticate_user!, except: [:about, :index, :trend_index]
  # before_action :set_tag, only: [:index, :trend_index]
  before_action :set_post_info,if: :use_before_action?
  before_action :post_params,except: [:about,:index]

  def index
    # @post_cs = PostC.includes(:user).order('created_at DESC').limit(9)
    # @post_bs = PostB.includes(:user).order('created_at DESC').limit(9)
    # @post_gs = PostG.includes(:user).order('created_at DESC').limit(9)
  
    if use_before_action?
      const_name = @post_name.gsub(/\b\w/) { |s| s.upcase }
      #サブクラスごとのオブジェクトを初期化
      post = self.class.const_get(const_name)
      @post = post.new
      @posts = Post.where(type: const_name)
    else
      posts = Post.includes(:user)
      @posts_b = posts.select{|x| x[:type].include?("Book")} 
      @posts_c = posts.select{|x| x[:type].include?("Clothe")} 
      @posts_g = posts.select{|x| x[:type].include?("Good")} 
    end
  end

  def trend_index
    @post_c_ranks = PostC.find(LikeC.group(:post_c_id).order('count(post_c_id) desc').limit(9).pluck(:post_c_id))
    @post_b_ranks = PostB.find(LikeB.group(:post_b_id).order('count(post_b_id) desc').limit(9).pluck(:post_b_id))
    @post_g_ranks = PostG.find(LikeG.group(:post_g_id).order('count(post_g_id) desc').limit(9).pluck(:post_g_id))
  end

  def about
  end

  def new
    const_name = @post_name.gsub(/\b\w/) { |s| s.upcase }
    post = self.class.const_get(const_name)
    @post = post.new
  end

  def create
    const_name = @post_name.gsub(/\b\w/) { |s| s.upcase }
    post = self.class.const_get(const_name)
    @post = post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  private
  
  def post_params
    params.require(@post_name).permit(:title, :image, :place, :brand, :story, :evidence, :tag_list).merge(user_id: current_user.id)
  end

  def use_before_action?
    false
  end
end
