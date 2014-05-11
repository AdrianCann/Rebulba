class Notification < ActiveRecord::Base

  include Rails.application.routes.url_helpers

  EVENTS = {
    1 => :comment_on_post,
    2 => :comment_after_comment,
    3 => :new_follower,
    4 => :liked_comment,
    5 => :liked_post
  }

  EVENT_IDS = EVENTS.invert

  belongs_to :user, inverse_of: :notifications, counter_cache: true
  belongs_to :notifiable, inverse_of: :notifications, polymorphic: true, counter_cache: true

  validates :event_id, inclusion: { in: EVENTS.keys }
  validates :is_read, inclusion: { in: [true, false] }
  validates :notifiable, :user, presence: true

  scope :read, -> { where(is_read: true) }
  scope :unread, -> { where(is_read: false) }
  scope :event, ->(event_name) { where(event_id: EVENT_IDS[event_name]) }

  def url
    case self.event_name
    when :comment_on_post
      comment = self.notifiable
      post = comment.post
      user = post.user
      user_url(user)
    when :liked_post
      like = self.notifiable
      post = like.likeable
      user = post.user
      user_url(user)
    when :comment_after_comment
      comment = self.notifiable
      post = comment.post
      user = post.user
      user_url(user)
    when :new_follower
      follower = self.notifiable.follower
      user_url(follower)
    when :liked_comment
      comment = self.notifiable.likeable
      post = comment.post
      user = post.user
      user_url(user)
    when :liked_post
      post = self.notifiable.likeable
      user = post.user
      user_url(user)
    end
  end

  def text
    case self.event_name
    when :comment_on_post
      comment = self.notifiable
      sender = comment.comment_sender
      post = comment.post

      "#{sender.username} commented on your post: #{post.title}"
    when :comment_after_comment
      comment = self.notifiable
      sender = comment.comment_sender
      post = comment.post

      "#{sender.username} commented after you on: #{post.title}"
    when :new_follower
      follower = self.notifiable.follower
      "#{follower.username} is now following you."
      
    when :liked_comment
      comment = self.notifiable.likeable
      liker = self.notifiable.user
      
      
      "#{liker.username} liked your #{self.notifiable.likeable_type}: #{comment.body}"
      
    when :liked_post
      comment = self.notifiable.likeable
      liker = self.notifiable.user
      
      "#{liker.username} liked your #{self.notifiable.likeable_type}: #{post.title}"
    end
  end

  def event_name
    EVENTS[self.event_id]
  end

  def default_url_options
    options = {}
    options[:host] = Rails.env.production? ? "rebulba.com" : "localhost:3000"
    options
  end
end