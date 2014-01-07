class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :topic
  validates :body, presence: true

  SUBJECT_HASH = {first: 1, second: 2}

  scope :supports_first_subject, -> {where(referred_subject: SUBJECT_HASH[:first])}
  scope :supports_second_subject, -> {where(referred_subject: SUBJECT_HASH[:second])}


  def referred_subject=(subject)
    write_attribute(:referred_subject, SUBJECT_HASH[subject.to_sym])
  end

  def referred_subject
    SUBJECT_HASH.key(read_attribute(:referred_subject))
  end
end
