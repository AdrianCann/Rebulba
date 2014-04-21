class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, null: false, unique: true
      t.string :email, null: false, unique: true
      t.string :password_digest, null: false
      t.string :token

      t.timestamps
    end

    add_index :users, :username
    add_index :users, :email
    add_index :users, :token
  end
end
