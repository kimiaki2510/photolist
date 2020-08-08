class Like < ApplicationRecord

#モデルとの結びつけ
  belongs_to :user
  belongs_to :record

#バリデーション
  validates_uniqueness_of :record_id, scope: :user_id
end
