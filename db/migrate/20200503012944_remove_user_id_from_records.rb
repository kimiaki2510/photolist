class RemoveUserIdFromRecords < ActiveRecord::Migration[5.2]
  def change
    remove_reference :records, :user_id, foreign_key: true
  end
end
