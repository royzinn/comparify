class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  validates :body, presence: true
end
