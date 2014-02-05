class Relationship < ActiveRecord::Base
  include PublicActivity::Common

  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"

  validates :follower_id, presence: true
  validates :followed_id, presence: true
  validate :cannot_follow_self

  private

  def cannot_follow_self
    if :follower_id == :followed_id
      errors[:base] << "well, you want to follow yourself? sure?"
    end
  end
end
