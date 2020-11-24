class PostCsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :show, :destroy]
  before_action :authenticate_user!, except: [:show, :index]
  before_action :move_to_index, only: :edit
  before_action :set_tag, only: :index

  def new
    @post = PostC.new
  end

  def create
    @post = PostC.new(post_params)
    if @post.save
      redirect_to user_url(current_user), notice: 'お気に入りを登録しました'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to user_url(current_user), notice: 'お気に入りを編集しました'
    else
      render :edit
    end
  end

  def show
    @comment = CommentC.new
    @comments = @post.comment_cs.includes(:user)
  end

  def destroy
    @post.destroy
    redirect_to user_url(current_user), notice: 'お気に入りを削除しました'
  end

  def index
    @post = PostC.includes(:user).order('created_at DESC').page(params[:page]).per(18)
  end

  private

  def post_params
    params.require(:post_c).permit(:title, :image, :place, :brand, :story, :evidence, :tag_list).merge(user_id: current_user.id)
  end

  def set_post
    @post = PostC.find(params[:id])
  end

  def move_to_index
    @post = PostC.find(params[:id])
    redirect_to posts_url unless current_user == @post.user
    flash[:alert] = '他人の投稿は編集できません'
  end

  def set_tag
    @tag_cs = PostC.tag_counts_on(:tags).most_used(10)
    @tag_bs = PostB.tag_counts_on(:tags).most_used(10)
    @tag_gs = PostG.tag_counts_on(:tags).most_used(10)
  end
end
