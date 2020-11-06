class User < ApplicationRecord
  before_create :default_image
  
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  has_one_attached :profile_image
  has_many :post_cs
  has_many :post_bs
  has_many :post_gs
  has_many :like_cs
  has_many :like_bs
  has_many :like_gs
  has_many :pick_cs
  has_many :pick_post_cs, through: :pick_cs, source: :post_c
  # 自分がフォローした側
  has_many :active_relationships,class_name: "Relationship",foreign_key: :following_id
  has_many :followings, through: :active_relationships, source: :follower
  # 自分がフォローされた側
  has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
  has_many :followers, through: :passive_relationships, source: :following
  
  validates :name,presence: true
  
  def default_image
    if !self.profile_image.attached?
      self.profile_image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'user_default.png')), filename: 'default-image.png', content_type: 'image/png')
    end
  end
  
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト"
    end
  end

  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end

end
