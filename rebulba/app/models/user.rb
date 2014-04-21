class User < ActiveRecord::Base
  validates :username, :email, :token, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }

  before_validation :ensure_session_token
  attr_reader :password

  has_many :posts,
  class_name: "Post",
  foreign_key: :user_id,
  primary_key: :id

  has_many :comments, through: :post, source: :user


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

end
