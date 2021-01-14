class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates :text, presence: true
  validates :text, length: { maximum: 500 }
end
