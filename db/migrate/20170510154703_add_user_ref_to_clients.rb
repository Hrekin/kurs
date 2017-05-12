class AddUserRefToClients < ActiveRecord::Migration
  def change
    add_reference :clients, :user, foreign_key: true
    add_index(:clients, :user_id, unique: true)
  end
end
