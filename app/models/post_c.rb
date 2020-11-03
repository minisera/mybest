class PostC < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :like_cs

  with_options  presence: true do
    validates :image
    validates :title
    validates :place
    validates :brand
    validates :story
    validates :evidence
  end

  validate :limit_post_c,on: :create

  def limit_post_c
    if user && user.post_cs.size >= 10
      errors.add(:user, "登録の制限数を超えました")
    end
  end

  def liked_by?(user)
    like_cs.where(user_id: user.id).exists?
end
end
