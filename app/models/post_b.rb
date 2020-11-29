class PostB < ApplicationRecord
  acts_as_taggable_on :tags
  belongs_to :user
  has_one_attached :image
  has_many :like_bs, dependent: :destroy
  has_many :pick_bs, dependent: :destroy
  has_many :comment_bs, dependent: :destroy

  with_options presence: true do
    validates :image
    validates :title, length: { maximum: 12 }
    validates :place
    validates :brand
    validates :story, length: { in: 30..200 }
    validates :evidence, length: { in: 30..200 }
  end

  validate :limit_post, on: :create

  def limit_post
    errors.add(:user, 'の登録制限数を超えました') if user && user.post_bs.size > 9
  end

  def liked_by?(user)
    like_bs.where(user_id: user.id).exists?
  end

  def picked_by?(user)
    pick_bs.where(user_id: user.id).exists?
  end
end
