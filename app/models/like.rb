class Like < ActiveRecord::Base
  validates :user_id, uniqueness: {scope: [:likeable_id, :likeable_type]}

  belongs_to :likeable, polymorphic: true
  belongs_to :user
  
  has_many :notifications, as: :notifiable, inverse_of: :notifiable, dependent: :destroy
  
  after_commit :set_notification, on: [:create]

  def set_notification   
    if self.likeable_type == "Post"
      like_note = self.notifications.unread.event(:liked_post).new
      like_note.user = self.likeable.user
    else
      like_note = self.notifications.unread.event(:liked_comment).new
      like_note.user = self.likeable.comment_sender
    end
    like_note.save

  end
end
