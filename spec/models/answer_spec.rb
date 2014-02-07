require 'spec_helper'

describe Answer do
  it { should belong_to(:user) }
  it { should belong_to(:topic) }
  it { should validate_presence_of(:body) }
  it { should validate_uniqueness_of(:user_id).scoped_to(:topic_id).with_message("You can only have one answer per topic") }

  describe "setting referred subject fields" do
    it "saves to the database" do
      topic = Fabricate(:topic)
      user = Fabricate(:user)
      answer = Answer.create(body: "hello", referred_subject: :first, user_id: user.id, topic_id: topic.id)
      expect(Answer.last.referred_subject).to eq(:first)
    end
  end

  describe "scopes" do
    it "returns all answer related to first subject" do
      3.times do |x|
        Answer.create(body: "hello #{x}", referred_subject: :first)
      end
      expect(Answer.supports_first_subject).to eq(Answer.last(3))
    end

    it "returns all answer related to second subject" do
      3.times do |x|
        Answer.create(body: "hello #{x}", referred_subject: :second)
      end
      expect(Answer.supports_second_subject).to eq(Answer.last(3))
    end
  end
end
