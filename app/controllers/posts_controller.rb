class PostsController < ApplicationController
  before_action :set_post_info,if: :use_before_action?
  before_action :set_new_post, only: [:new,:create]
  before_action :authenticate_user!, except: [:about, :index, :trend_index]
  before_action :set_tag, only: [:index, :trend_index,:tag_index]
  before_action :set_post, only: [:show,:edit,:update,:destroy,:move_to_index]
  before_action :move_to_index,only: :edit

  def index
    if use_before_action?
      const_name = @post_name.gsub(/\b\w/) { |s| s.upcase }
      @posts = Post.where(type: const_name).includes(:user).page(params[:page]).per(18)
    else
      posts = Post.includes(:user)
      @posts_b = posts.select{|x| x[:type].include?("Book")} 
      @posts_c = posts.select{|x| x[:type].include?("Clothe")} 
      @posts_g = posts.select{|x| x[:type].include?("Good")} 
    end
  end
  
  def trend_index
    @post_c_ranks = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(9).pluck(:post_id)).select{|x| x[:type].include?("Clothe")} 
    @post_b_ranks = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(9).pluck(:post_id)).select{|x| x[:type].include?("Book")} 
    @post_g_ranks = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(9).pluck(:post_id)).select{|x| x[:type].include?("Good")} 
  end

  def about
  end

  def new
    @post = @post_class.new
  end
  
  def create
    @post = @post_class.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @post.update(post_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end
  
  def destroy
    @post.destroy
    redirect_to user_path(current_user)
  end

  def tag_index
    @posts = Post.tagged_with(params[:tag])
    @tag = params[:tag]
  end
  
  private
  def use_before_action?
    false
  end
  
  def post_params
    params.require(@post_name).permit(:title, :image, :place, :brand, :story, :evidence, :tag_list).merge(user_id: current_user.id)
  end
  
  def move_to_index
    unless current_user == @post.user
      redirect_to posts_url
      flash[:alert] = '他人の投稿は編集できません'
    end
  end
  
  def set_post
    @post = Post.find(params[:id])
  end
  
  def set_new_post
    const_name = @post_name.gsub(/\b\w/) { |s| s.upcase }
    @post_class = self.class.const_get(const_name)
  end

  def set_tag
    @tag_cs = Clothe.tag_counts_on(:tags).most_used(10)
    @tag_bs = Book.tag_counts_on(:tags).most_used(10)
    @tag_gs = Good.tag_counts_on(:tags).most_used(10)
  end

end
