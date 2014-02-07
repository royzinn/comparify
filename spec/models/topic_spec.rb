require 'spec_helper'

describe Topic do
  subject(:topic) { Topic.create(first_subject: "RaiLs", second_subject: "meTeor", question: "Which one is Better") }

  it { should belong_to(:user) }
  it { should validate_presence_of(:first_subject) }
  it { should validate_presence_of(:second_subject) }
  it { should validate_presence_of(:question) }
  it { should validate_uniqueness_of(:question).scoped_to(:first_subject, :second_subject).case_insensitive.with_message("Someone already asked this exact question, go figure") }

  describe "downcase attributes" do
    its(:first_subject) { should eq "rails" }
    its(:second_subject) { should eq "meteor" }
    its(:question) { should eq "Which one is Better".downcase }
  end

  describe "custom validations" do
    it "fails validation with similar subjects" do
      topic = Topic.new(first_subject: "Rails", second_subject: "rails", question: "some question")
      expect(topic).to have(1).error_on(:base)
    end

    it "passes validation with different subjects" do
      topic = Topic.create!(first_subject: "Rails", second_subject: "Relish", question: "some question")
      expect(Topic.last.first_subject).to eq("rails")
      expect(Topic.last.second_subject).to eq("relish")
    end
  end
end
