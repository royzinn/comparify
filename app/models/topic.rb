class Topic < ActiveRecord::Base
  include PublicActivity::Common
  extend FriendlyId

  before_save :downcase_attributes
  belongs_to :user
  belongs_to :category, counter_cache: true
  has_many :answers, dependent: :destroy

  validates :first_subject, presence: true
  validates :second_subject, presence: true
  validates :question, presence: true,
            uniqueness: {scope: [:first_subject, :second_subject],
            case_sensitive: false, message: "Someone already asked this exact question, go figure"}
  validate :has_different_subjects

  friendly_id :subjects_with_question, use: :slugged
  acts_as_taggable

  def user_already_answered?(user)
    answers.where(user_id: user.id).empty?
  end


  private
  def subjects_with_question
    "#{first_subject}-versus-#{second_subject}-#{question}"
  end

  def downcase_attributes
    self.first_subject = self.first_subject.downcase
    self.second_subject = self.second_subject.downcase
    self.question = self.question.downcase
  end

  def has_different_subjects
    if self.first_subject && self.second_subject && self.first_subject.downcase == self.second_subject.downcase
      errors[:base] << "subjects for comparisson can't be the same"
    end
  end
end
