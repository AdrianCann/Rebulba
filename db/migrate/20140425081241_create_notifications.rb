class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.integer :notifiable_id
      t.string :notifiable_type
      t.integer :event_id
      t.boolean :read?
      
      t.timestamps
    end
  end
end
