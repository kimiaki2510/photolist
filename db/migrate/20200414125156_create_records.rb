class CreateRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :records do |t|
      t.string :title
      t.string :content
      t.references :user, foreign_key: true
      t.string :photo

      t.timestamps      
    end
  end
end
