class Record < ApplicationRecord
  belongs_to :user
  has_many :likes
  mount_uploader :photo, PhotoUploader
  validates :content, presence: true, length: {maximum: 255}


  def like_by?(user)
    likes.where(user_id: user.id).exists?
  end

end
