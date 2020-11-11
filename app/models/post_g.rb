class PostG < ApplicationRecord
  acts_as_taggable_on :tags
  belongs_to :user
  has_one_attached :image
  has_many :like_gs,dependent: :destroy
  has_many :pick_gs,dependent: :destroy
  has_many :comment_gs,dependent: :destroy

  with_options  presence: true do
    validates :image
    validates :title
    validates :place
    validates :brand
    validates :story
    validates :evidence
  end

  validate :limit_post_g,on: :create

  def limit_post_g
    if user && user.post_cs.size >= 10
      errors.add(:user, "登録の制限数を超えました")
    end
  end
  
  def liked_by?(user)
    like_gs.where(user_id: user.id).exists?
  end

  def picked_by?(user)
    pick_gs.where(user_id: user.id).exists?
  end
end
