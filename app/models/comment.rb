class Comment < ActiveRecord::Base

  validates :body, presence: true

  belongs_to :post, inverse_of: :comments
  has_many :likes, as: :likeable, dependent: :destroy

  # belongs_to :comment_receiver,
  # class_name: "User",
  # foreign_key: :

  belongs_to :comment_sender, inverse_of: :sent_comments,
  class_name: "User",
  foreign_key: :user_id
   #necessary?

  has_many :likers, through: :likes, source: :user

end
