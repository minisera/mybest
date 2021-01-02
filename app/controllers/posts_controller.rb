class PostsController < ApplicationController
  before_action :set_post_info, if: :use_before_action?
  before_action :set_new_post, only: [:new, :create]
  before_action :authenticate_user!, except: [:about, :index, :trend_index,:show]
  before_action :set_tag, only: [:index, :trend_index, :tag_index]
  before_action :set_post, only: [:show, :edit, :update, :destroy, :move_to_index]
  before_action :move_to_index, only: :edit

  def index
    if use_before_action?
      const_name = @post_name.gsub(/\b\w/) { |s| s.upcase }
      @posts = Post.where(type: const_name).includes(:user).order("created_at DESC").page(params[:page]).per(18)
    else
      @posts = Post.includes(:likes,user: {profile_image_attachment: :blob}).with_attached_image.order("created_at DESC")
      # sort_post_type(posts)
    end
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
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
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
    @posts = Post.tagged_with(params[:tag]).order("created_at DESC")
    @tag = params[:tag]
  end
  
  def trend_index
    posts = Post.includes(:user).sort{|a,b| b.likes.size <=> a.likes.size}
    sort_post_type(posts)
  end
  
  def about
  end
  
private
  
  def use_before_action?
    false
  end
  
  def set_new_post
    const_name = @post_name.gsub(/\b\w/) { |s| s.upcase }
    @post_class = self.class.const_get(const_name)
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
  
  def set_tag
    @tags_c = Clothe.tag_counts_on(:tags).most_used(10)
    @tags_b = Book.tag_counts_on(:tags).most_used(10)
    @tags_g = Good.tag_counts_on(:tags).most_used(10)
  end
  
  def sort_post_type(posts)
    @posts_b = posts.select { |x| x[:type].include?('Book') }.take(9)
    @posts_c = posts.select { |x| x[:type].include?('Clothe') }.take(9)
    @posts_g = posts.select { |x| x[:type].include?('Good') }.take(9)
  end

end
