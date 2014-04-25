class Post < ActiveRecord::Base
  validates :title, :body, presence: true

  belongs_to :user
  has_many  :likes, as: :likeable
  has_many :likers, through: :likes, source: :user

  has_many :comments, dependent: :destroy, inverse_of: :post
end
