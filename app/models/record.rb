class Record < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  mount_uploader :photo, PhotoUploader
  validates :content, presence: true, length: {maximum: 255}

  
end
