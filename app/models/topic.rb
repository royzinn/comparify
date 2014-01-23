class Topic < ActiveRecord::Base
  extend FriendlyId
  belongs_to :user
  has_many :answers, dependent: :destroy, counter_cache: true
  friendly_id :subjects_with_question, use: :slugged
  validates :first_subject, presence: true
  validates :second_subject, presence: true
  validates :question, presence: true,
            uniquness: {scope: [:first_subject, :second_subject],
            case_sensitive: false, message: "Someone already asked this exact question, go figure"}


  private
  def subjects_with_question
    "#{first_subject}-VS-#{second_subject}-#{question}"
  end
end
