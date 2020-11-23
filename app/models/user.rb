class User < ApplicationRecord
  before_create :default_image

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :profile_image
  # 投稿に対するリレーション
  has_many :post_cs, dependent: :destroy
  has_many :post_bs, dependent: :destroy
  has_many :post_gs, dependent: :destroy
  # コメントに対するリレーション
  has_many :comment_cs, dependent: :destroy
  has_many :comment_bs, dependent: :destroy
  has_many :comment_gs, dependent: :destroy
  # いいねに対するリレーション
  has_many :like_cs, dependent: :destroy
  has_many :like_bs, dependent: :destroy
  has_many :like_gs, dependent: :destroy
  # Pickに対するリレーション
  has_many :pick_cs, dependent: :destroy
  has_many :pick_post_cs, through: :pick_cs, source: :post_c
  has_many :pick_bs, dependent: :destroy
  has_many :pick_post_bs, through: :pick_bs, source: :post_b
  has_many :pick_gs, dependent: :destroy
  has_many :pick_post_gs, through: :pick_gs, source: :post_g
  # 自分がフォローした側
  has_many :active_relationships, class_name: 'Relationship', foreign_key: :following_id, dependent: :destroy
  has_many :followings, through: :active_relationships, source: :follower
  # 自分がフォローされた側
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: :follower_id, dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :following

  validates :name, presence: true

  def default_image
    unless profile_image.attached?
      profile_image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'user_default.png')), filename: 'default-image.png', content_type: 'image/png')
    end
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = 'ゲスト'
    end
  end

  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end
end
