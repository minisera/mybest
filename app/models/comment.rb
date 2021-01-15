class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  CHECKER_JP=/\A[ぁ-んァ-ン一-龥a-zA-Z0-9０-９\、\。\「\」\【\】\（\）\！\？\％\『\』\s\ー\-\・\…]+\z/
  validates :text, presence: true,length: { maximum: 500 },format: {with: CHECKER_JP}
end
