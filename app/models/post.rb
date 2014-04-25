class Post < ActiveRecord::Base
  validates :title, :body, presence: true

  belongs_to :user, inverse_of: :posts
  has_many  :likes, as: :likeable
  has_many :likers, through: :likes, source: :user

  has_many :comments, inverse_of: :posts, dependent: :destroy
end
