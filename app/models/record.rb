class Record < ApplicationRecord

#モデルとの結びつけ
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :likes_users, through: :likes, source: :user

#Record機能追加
  mount_uploader :photo, PhotoUploader

#バリデーション
  validates :content, presence: true, length: {maximum: 255}

end
