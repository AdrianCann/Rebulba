class User < ActiveRecord::Base
  validates :username, :email, :token, presence: true, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_attachment_file_name :avatar, :matches => [/png\Z/, /jpe?g\Z/]

  before_validation :ensure_session_token
  attr_reader :password

  has_many :posts,
  class_name: "Post",
  foreign_key: :user_id,
  primary_key: :id,
  inverse_of: :user,
  dependent: :destroy

  has_many :comments, through: :post, source: :user

  has_many :sent_comments,
  class_name: "Comment",
  foreign_key: :user_id,
  primary_key: :id,
  inverse_of: :comment_sender

  has_many :inbound_followings,
  class_name: "Following",
  foreign_key: :followee_id,
  primary_key: :id,
  dependent: :destroy

  has_many :outbound_followings,
  class_name: "Following",
  foreign_key: :follower_id,
  primary_key: :id,
  dependent: :destroy

  has_many :people_he_follows, through: :outbound_followings, source: :followee
  has_many :followers, through: :inbound_followings, source: :follower

  has_many :likes
  has_many :comments, through: :posts, source: :comments

  def self.generate_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_token!
    self.token = User.generate_token
    self.save!
    self.token
  end

  def self.find_by_credentials(email, password)
    user = User.find_by_email(email)

    user.try(:is_password?, password) ? user : nil
  end

  def is_password?(undigested_password)
    BCrypt::Password.new(self.password_digest).is_password?(undigested_password)
  end

  def password=(undigested_password)
    if undigested_password.present?
      @password = undigested_password
      self.password_digest = BCrypt::Password.create(undigested_password)
    end
  end

  def ensure_session_token
    self.token ||= User.generate_token
  end

  def generate_feed_posts
    self.people_he_follows.includes(:posts).map(&:posts).flatten
  end

end
