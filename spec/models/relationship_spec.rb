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
  end

  describe "when followed id is not present" do
    before { relationship.followed_id = nil }
    it { should_not be_valid }
  end

  describe "when follower id is not present" do
    before { relationship.follower_id = nil }
    it { should_not be_valid }
  end

  describe "when trying to follow self" do
    before { relationship.followed_id = follower.id }
    it { should_not be_valid }
  end
end
