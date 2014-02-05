require 'spec_helper'

describe Relationship do
  let(:follower) { Fabricate(:user) }
  let(:followed) { Fabricate(:user) }
  let(:relationship) { follower.relationships.build(followed_id: followed.id) }

  subject { relationship }

  describe "following method" do
    it {should belong_to(:follower)}
    it {should belong_to(:followed)}
    its(:follower) {should eq follower}
    its(:followed) {should eq followed}

    it "fails validation when trying to follow self" do
      roy = follower
      relationship = Relationship.new(follower: roy, followed: roy)
      expect(relationship).to have(1).error_on(:base)
    end
  end

  describe "when followed id is not present" do
    before { relationship.followed_id = nil }
    it { should_not be_valid }
  end

  describe "when follower id is not present" do
    before { relationship.follower_id = nil }
    it { should_not be_valid }
  end

end
