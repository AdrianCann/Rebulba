class Comment < ActiveRecord::Base

  validates :body, presence: true

  belongs_to :post, inverse_of: :comments
  has_many :likes, as: :likeable, dependent: :destroy

  belongs_to :comment_sender, inverse_of: :sent_comments,
  class_name: "User",
  foreign_key: :user_id

  has_many :likers, through: :likes, source: :user
  
  has_many :notifications, as: :notifiable, inverse_of: :notifiable, dependent: :destroy

  after_commit :set_notification, on: [:create]
  
  def set_notification
    notification = self.notifications.unread.event(:comment_on_post).new
    notification.user = self.post.user
    notification.save
    
    self.post.comments.each do |comment|
      after_comment_notification = comment.notifications.unread.event(:comment_after_comment).new
      after_comment_notifiaction.user = comment.comment_sender
      after_comment_notification.save
    end
  end
end
