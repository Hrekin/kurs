class CreateQqqs < ActiveRecord::Migration
  def change
    create_table :qqqs do |t|
      t.string :qq

      t.timestamps null: false
    end
  end
end
