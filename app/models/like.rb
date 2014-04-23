class Like < ActiveRecord::Base
  validates :user_id, uniqueness: {scope: [:likeable_id, :likeable_type]}

  belongs_to :likeable, polymorphic: true
  belongs_to :user

end
