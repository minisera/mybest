class GoodsController < PostsController
  include CommonActions

  before_action :set_post, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  before_action :move_to_index, only: :edit
  before_action :set_tag, only: :index

  def new
    @post = PostG.new
  end

  def create
    @post = PostG.new(post_params)
    post_save
  end

  def edit
  end

  def update
    post_update
  end

  def show
    @comment = CommentG.new
    @comments = @post.comment_gs.includes(:user)
  end

  def destroy
    post_destroy
  end

  def index
    @post = PostG.includes(:user).order('created_at DESC').page(params[:page]).per(18)
  end

  private

  def post_params
    params.require(:post_g).permit(:title, :image, :place, :brand, :story, :evidence, :tag_list).merge(user_id: current_user.id)
  end

  def set_post
    @post = PostG.find(params[:id])
  end

  def move_to_index
    @post = PostG.find(params[:id])
    unless current_user == @post.user
      redirect_to posts_url
      flash[:alert] = '他人の投稿は編集できません'
    end
  end

end
