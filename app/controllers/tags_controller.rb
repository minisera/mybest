class TagsController < ApplicationController
  include CommonActions
  # before_action :set_tag
  def index
    @post_cs = PostC.tagged_with(params[:tag])
    @post_bs = PostB.tagged_with(params[:tag])
    @post_gs = PostG.tagged_with(params[:tag])
    @tag = params[:tag]
  end
end
