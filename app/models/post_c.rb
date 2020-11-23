class PostC < ApplicationRecord
  acts_as_taggable_on :tags
  belongs_to :user
  has_one_attached :image
  has_many :like_cs, dependent: :destroy
  has_many :pick_cs, dependent: :destroy
  has_many :comment_cs, dependent: :destroy

  with_options presence: true do
    validates :image
    validates :title, length: { maximum: 10 }
    validates :place
    validates :brand
    validates :story, length: { in: 30..200 }
    validates :evidence, length: { in: 30..200 }
  end

  validate :limit_post_c, on: :create

  def limit_post_c
    errors.add(:user, '登録の制限数を超えました') if user && user.post_cs.size > 10
  end

  def liked_by?(user)
    like_cs.where(user_id: user.id).exists?
  end

  def picked_by?(user)
    pick_cs.where(user_id: user.id).exists?
  end
end
