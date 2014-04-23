class Comment < ActiveRecord::Base

  validates :body, presence: true

  belongs_to :post
  has_many :likes, as: :likeable

end
