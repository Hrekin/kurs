class CreateWorksheets < ActiveRecord::Migration
  def change
    create_table :worksheets do |t|
      t.references :client, foreign_key: true
      t.index :client_id, unique: true
      t.string :description_client, null: false
      t.string :hobbies, null: false
      t.string :pernicious_habits, null: false
      t.string :accommodation_type, null: false
      t.string :purpose_acquaintance, null: false
      t.timestamps null: false
    end
  end
end
