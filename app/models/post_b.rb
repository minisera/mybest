class PostB < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :like_bs

  with_options  presence: true do
    validates :image
    validates :title
    validates :place
    validates :brand
    validates :story
    validates :evidence
  end

  validate :limit_post_b,on: :create

  def limit_post_b
    if user && user.post_bs.size >= 10
      errors.add(:user, "登録の制限数を超えました")
    end
  end

  def liked_by?(user)
    like_bs.where(user_id: user.id).exists?
  end
end
