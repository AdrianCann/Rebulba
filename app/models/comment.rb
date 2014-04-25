class Comment < ActiveRecord::Base

  validates :body, presence: true

  belongs_to :post, inverse_of: :comments
  has_many :likes, as: :likeable
  belongs_to :user inverse_of: :comments
  has_many :likers, through: :likes, source: :user

end
