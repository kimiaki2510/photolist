class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.string :title
      t.string :content
      t.references :user_id, foreign_key: true
      t.string :photo

      t.timestamps
    end
  end
end
