class Following < ActiveRecord::Base

  validates :follower, uniqueness: { scope: :followee }

  belongs_to :follower,
              class_name: "User",
              foreign_key: :follower_id,
              primary_key: :id

  belongs_to :followee,
              class_name: "User",
              foreign_key: :followee_id,
              primary_key: :id

end
