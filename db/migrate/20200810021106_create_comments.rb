class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :content      
      t.references :user, foreign_key: true
      t.references :record, foreign_key: true

      t.timestamps

      t.index [:user_id, :record_id], unique: true
    end
  end
end
