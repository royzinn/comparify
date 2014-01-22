class Topic < ActiveRecord::Base
  extend FriendlyId
  belongs_to :user
  has_many :answers, dependent: :destroy, counter_cache: true
  friendly_id :subjects_with_question, use: :slugged
  validates :first_subject, presence: true
  validates :second_subject, presence: true
  validates :question, presence: true

  private
  def subjects_with_question
    "#{first_subject}-VS-#{second_subject}-#{question}"
  end
end
