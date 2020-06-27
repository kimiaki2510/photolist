class Record < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :likes_users, through: :likes, source: :user

  mount_uploader :photo, PhotoUploader
  validates :content, presence: true, length: {maximum: 255}

end
