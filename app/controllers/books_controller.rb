class BooksController < PostsController
  # include CommonActions

  # before_action :set_post, only: [:edit, :update, :show, :destroy]
  # before_action :authenticate_user!, except: [:show, :index]
  # before_action :move_to_index, only: :edit
  # before_action :set_tag, only: :index

  # def new
  #   @post = PostB.new
  # end

  # def create
  #   @post = PostB.new(post_params)
  #   post_save
  # end

  # def edit
  # end

  # def update
  #   post_update
  # end

  # def show
  #   @comment = CommentB.new
  #   @comments = @post.comment_bs.includes(:user)
  # end

  # def destroy
  #   post_destroy
  # end

  # def index
  #   @post = PostB.includes(:user).order('created_at DESC').page(params[:page]).per(18)
  # end

  private

  # def post_params
  #   params.require(:post_b).permit(:title, :image, :place, :brand, :story, :evidence, :tag_list).merge(user_id: current_user.id)
  # end

  # def set_post
  #   @post = PostB.find(params[:id])
  # end



  def move_to_index
    @post = PostB.find(params[:id])
    unless current_user == @post.user
      redirect_to posts_url
      flash[:alert] = '他人の投稿は編集できません'
    end
  end

  def set_post_info
    @post_name = "book"
  end

  def use_before_action?
    true
  end

end
