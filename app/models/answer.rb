class Answer < ActiveRecord::Base
  include PublicActivity::Common

  belongs_to :user
  belongs_to :topic, counter_cache: true

  validates :body, presence: true
  validates :user_id, :uniqueness => { scope: :topic_id,
                                       message: "You can only have one answer per topic" }

  SUBJECT_HASH = {first: 1, second: 2}
  enum referred_subject: [ :first, :second ]

  scope :supports_first_subject,  -> {where(referred_subject: :first)}
  scope :supports_second_subject, -> {where(referred_subject: :second)}


  # def referred_subject=(subject)
  #   write_attribute(:referred_subject, SUBJECT_HASH[subject.to_sym])
  # end

  # def referred_subject
  #   SUBJECT_HASH.key(read_attribute(:referred_subject))
  # end
end
