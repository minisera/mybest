class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :picks, dependent: :destroy
  has_many :comments, dependent: :destroy
  acts_as_taggable_on :tags
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :title, length: { maximum: 12 }
    validates :place
    validates :brand
    validates :story, length: { in: 30..200 }
    validates :evidence, length: { in: 30..200 }
  end

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  def picked_by?(user)
    picks.where(user_id: user.id).exists?
  end
end
