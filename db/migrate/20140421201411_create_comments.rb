class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :post_id
      t.text :body, null: false

      t.timestamps
    end

    add_index :comments, :post_id
  end
end
