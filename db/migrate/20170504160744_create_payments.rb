class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :client, index: true, foreign_key: true
      t.string :service_type, null: false
      t.float :price, null: false
      t.datetime :payment_time, null: false
      t.integer :validity_service, null: false
      t.timestamps null: false
    end
  end
end
