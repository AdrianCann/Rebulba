class AddCounterCaches < ActiveRecord::Migration
  def change
    add_column :users, :posts_count, :integer
    add_column :users, :notifications_count, :integer
    add_column :users, :comments_count, :integer
    
    add_column :users, :followers_count, :integer
    add_column :users, :followings_count, :integer
    
    add_column :posts, :likes_count, :integer
    add_column :comments, :likes_count, :integer
    add_column :comments, :notifications_count, :integer
    
  end
end
