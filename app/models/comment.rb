class Comment < ActiveRecord::Base

  validates :body, presence: true

  belongs_to :post
  has_many :likes, as: :likeable
  belongs_to :user
  has_many :likers, through: :likes, source: :user

end
