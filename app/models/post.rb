class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :like_user,through: :likes,source: :user
  has_many :picks, dependent: :destroy
  has_many :comments, dependent: :destroy
  acts_as_taggable_on :tags
  has_one_attached :image

  CHECKER_JP=/\A[ぁ-んァ-ン一-龥a-zA-Z0-9０-９\、\。\「\」\【\】\（\）\！\？\％\『\』]+\z/

  with_options presence: true do
    validates :image
    validates :title, length: { maximum: 12 },format: {with: CHECKER_JP}
    validates :place, length: { maximum: 10 },format: {with: CHECKER_JP}
    validates :brand, length: { maximum: 10 },format: {with: CHECKER_JP}
    validates :story, length: { in: 30..200 },format: {with: CHECKER_JP}
    validates :evidence, length: { in: 30..200 },format: {with: CHECKER_JP}
  end

  def picked_by?(user)
    picks.where(user_id: user.id).exists?
  end
end
