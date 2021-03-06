class Following < ActiveRecord::Base

  validates :follower, uniqueness: { scope: :followee }

  belongs_to :follower,
              class_name: "User",
              foreign_key: :follower_id,
              primary_key: :id

  belongs_to :followee,
              class_name: "User",
              foreign_key: :followee_id,
              primary_key: :id
  
  has_many :notifications, as: :notifiable, inverse_of: :notifiable, dependent: :destroy
              
  after_commit :set_notification, on: [:create]
              
  
  def set_notification
    note = self.notifications.unread.event(:new_follower).new
    note.user = self.followee
    note.save

  end

end
