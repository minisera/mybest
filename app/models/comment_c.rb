class CommentC < ApplicationRecord
  belongs_to :user
  belongs_to :post_c
end
