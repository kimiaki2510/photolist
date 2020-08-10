class Comment < ApplicationRecord
  #モデルとの結びつけ
  belongs_to :user
  belongs_to :record

  #バリデーション
  validates :content, presence: true, length: {maximum: 100}
end
