class Post < ActiveRecord::Base
  validates :title, :body, presence: true
  before_create :set_likes

  belongs_to :user
  has_many  :likes, as: :likeable, dependent: :destroy
  has_many :likers, through: :likes, source: :user

  has_many :comments, dependent: :destroy, inverse_of: :post
  
  def set_likes
    self.likes_count = 0
  end
end
