class Post < ActiveRecord::Base
  validates :title, :body, presence: true

  belongs_to :user
  has_many  :likes, as: :likeable

  has_many :comments, dependent: :destroy
end
