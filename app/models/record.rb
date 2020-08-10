class Record < ApplicationRecord

#モデルとの結びつけ
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comment, dependent: :destroy

#Record機能追加
  mount_uploader :photo, PhotoUploader

#バリデーション
  validates :title, presence: true, length: {maximum: 30}
  validates :content, presence: true, length: {maximum: 255}

  def like_user(id)
    likes.find_by(user_id: id)
  end

end
