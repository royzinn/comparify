class Topic < ActiveRecord::Base

  validates :first_subject, presence: true
  validates :second_subject, presence: true
  validates :question, presence: true
  belongs_to :user
end
