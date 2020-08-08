class Relationship < ApplicationRecord

#モデルとの結びつけ
  belongs_to :user
  belongs_to :follow, class_name: 'User'
end
