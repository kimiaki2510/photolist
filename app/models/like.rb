class Like < ApplicationRecord
  belongs_to :user
  belongs_to :record
  #validates :user_id, presence: true
  #validates :record_id, presence: true
   validates_uniqueness_of :record_id, scope: :user_id
end
