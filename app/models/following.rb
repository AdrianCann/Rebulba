class Following < ActiveRecord::Base

  validate :cannot_follow_same_person_twice

  belongs_to :follower,
              class_name: "User",
              foreign_key: :follower_id,
              primary_key: :id

  belongs_to :followee,
              class_name: "User",
              foreign_key: :followee_id,
              primary_key: :id

  def cannot_follow_same_person_twice
    count = Following.where("followee_id = ? AND follower_id = ?", self.followee_id, self.follower_id).count
    if count > 0
      errors.add(:followee_id, "You are already a follower!")
    end
  end

end
