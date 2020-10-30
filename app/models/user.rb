class User < ApplicationRecord
  before_create :default_image

  def default_image
    if !self.profile_image.attached?
      self.profile_image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'user_default.png')), filename: 'default-image.png', content_type: 'image/png')
    end
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :profile_image
  has_many :post_cs
  has_many :post_bs


  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲスト"
    end
  end
end
