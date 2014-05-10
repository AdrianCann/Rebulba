class Like < ActiveRecord::Base
  validates :user_id, uniqueness: {scope: [:likeable_id, :likeable_type]}
  before_save :up_count
  # before_destroy :adjust_like_count

  belongs_to :likeable, polymorphic: true
  belongs_to :user
  
  def up_count
    if self.likeable_type == "Post"
      likeable = Post.find(self.likeable_id)
    else
      likeable = Comment.find(self.likeable_id)
    end
    
    likeable.likes_count += 1
    likeable.save
  end
  
  # def adjust_like_count
  #   if self.likeable_type == "Post"
  #     likeable = Post.find(self.likeable_id)
  #     likeable.likes_count = 0
  #     likeable.save
  #   else
  #     likeable = Comment.find(self.likeable_id)
  #     likeable.likes_count = 0
  #     likeable.save
  #   end
  # end

end
