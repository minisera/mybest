class ClothesController < PostsController
  # include CommonActions

  # before_action :set_post, only: [:edit, :update, :show, :destroy]
  # before_action :authenticate_user!, except: [:show, :index]
  # before_action :move_to_index, only: :edit
  # before_action :set_tag, only: :index

  # def new
  #   @post = PostC.new
  # end

  # def create
  #   @post = PostC.new(post_params)
  #   post_save
  # end

  # def edit
  # end

  # def update
  #   post_update
  # end

  # def show
  #   @comment = CommentC.new
  #   @comments = @post.comment_cs.includes(:user)
  # end

  # def destroy
  #   post_destroy
  # end

  # def index
  #   @post = PostC.includes(:user).order('created_at DESC').page(params[:page]).per(18)
  # end

  private

  def set_post_info
    @post_name = "clothe"
  end

  def move_to_index
    @post = PostC.find(params[:id])
    unless current_user == @post.user
      redirect_to posts_url
      flash[:alert] = '他人の投稿は編集できません'
    end
  end

  def use_before_action?
    true
  end

end
