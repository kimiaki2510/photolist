class Record < ApplicationRecord
  belongs_to :user
  mount_uploader :photo, PhotoUploader
  validates :content, presence: true, length: {maximum: 255}
end
