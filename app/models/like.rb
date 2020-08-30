class Like < ApplicationRecord

#モデルとの結びつけ
  belongs_to :user
  belongs_to :record

#バリデーション
#likeテーブルにrecord_idに対するuser_idは一意である。
  validates_uniqueness_of :record_id, scope: :user_id
end
