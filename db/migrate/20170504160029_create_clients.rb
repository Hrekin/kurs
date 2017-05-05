class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :client_login, null: false
      t.string :client_password, null: false
      t.string :client_name, null: false
      t.string :client_sex, null: false
      t.date :client_birthday, null: false
      t.string :client_country, null: false
      t.string :client_city, null: false
      t.string :client_mail, null: false
      t.datetime :client_last_visit, null: false
      t.integer :client_rating, null: false
      t.index :client_mail, unique: true

      t.timestamps null: false
    end
  end
  def reversible
    def self.up
      execute("ADD CONSTRAIN clients sex_check CHECK sex('м','ж')")
    end
  end
end
