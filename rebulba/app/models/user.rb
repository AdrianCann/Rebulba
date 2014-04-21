class User < ActiveRecord::Base
  validates :username, :email, :token, presence: true, uniqueness: true

  before_validation :ensure_session_token

  def self.generate_token
    SecureRandom::urlsafe_base64(16)
  end

  def self.reset_token!
    self.token = User.generate_token
    self.save
    self.token
  end

  def self.find_by_credentials(username, password)

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
