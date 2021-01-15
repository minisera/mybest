class User < ApplicationRecord
  before_create :default_image

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :profile_image
  # 投稿に対するリレーション
  has_many :posts, dependent: :destroy
  has_many :books, dependent: :destroy
  has_many :clothes, dependent: :destroy
  has_many :goods, dependent: :destroy
  # コメントに対するリレーション
  has_many :comments, dependent: :destroy
  # いいねに対するリレーション
  has_many :likes, dependent: :destroy
  # Pickに対するリレーション
  has_many :picks, dependent: :destroy
  has_many :pick_posts, through: :picks, source: :post
  # 自分がフォローした側
  has_many :active_relationships, class_name: 'Relationship', foreign_key: :following_id, dependent: :destroy
  has_many :followings, through: :active_relationships, source: :follower
  # 自分がフォローされた側
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: :follower_id, dependent: :destroy
  has_many :followers, through: :passive_relationships, source: :following

  CHECKER_JP=/\A[ぁ-んァ-ン一-龥a-zA-Z0-9０-９\、\。\「\」\【\】\（\）\！\？\％\『\』]+\z/
  validates :name, presence: true,length: { maximum: 10 },format: {with: CHECKER_JP}
  validates :profile,length: { maximum: 200 },format: {with: CHECKER_JP}

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

  # 自分がフォローする時、フォローされるユーザーは既にフォローされているか？
  def followed_by?(user)
    passive_relationships.find_by(following_id: user.id).present?
  end
end
