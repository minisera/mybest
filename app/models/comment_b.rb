class CommentB < ApplicationRecord
  belongs_to :user
  belongs_to :post_b

  validates :text, presence: true
end
