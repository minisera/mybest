class PostsController < ApplicationController
  def index
    @post_cs = PostC.includes(:user)
    @post_bs = PostB.includes(:user)
  end

end
