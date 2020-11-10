class CommentC < ApplicationRecord
  belongs_to :user
  belongs_to :post_c

  validates :text,presence: true
end
