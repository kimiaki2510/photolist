class Record < ApplicationRecord
  belongs_to :user_id

  validates :content, presence: true, length: {maximum: 255}
end
