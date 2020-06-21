class Record < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :iine_users, through: :likes, source: :user
  #has_many :liked_users, through: :likes, source: :user


  mount_uploader :photo, PhotoUploader
  validates :content, presence: true, length: {maximum: 255}

#いいねする
  def iine(user)
    likes.create(user_id: user.id)
  end

#いいね解除
  def uniine(user)
    likes.find_by(user_id: user.id).destroy
  end

#現在のユーザーがいいねをしているか判断
  def iine?(user)
    iine_users.include?(user)
  end

end
