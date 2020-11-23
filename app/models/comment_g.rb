class CommentG < ApplicationRecord
  belongs_to :user
  belongs_to :post_g

  validates :text, presence: true
end
