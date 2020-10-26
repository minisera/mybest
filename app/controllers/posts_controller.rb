class PostsController < ApplicationController
def index
  @post_cs = PostC.includes(:user)
end

end
