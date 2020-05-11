class Record < ApplicationRecord
  belongs_to :user
  has_many :likes, foreign_key: 'record_id', dependent: :destroy
  mount_uploader :photo, PhotoUploader
  validates :content, presence: true, length: {maximum: 255}

end
