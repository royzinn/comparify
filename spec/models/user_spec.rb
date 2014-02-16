require 'spec_helper'

describe User do
  before { @user = Fabricate(:user) }
  subject { @user }

  it { should have_many(:topics) }
  it { should have_many(:answers) }
  it { should have_many(:relationships) }
  it { should have_many(:followed_users) }
  it { should have_many(:comments) }
  it { should respond_to(:following?) }
  it { should respond_to(:follow!) }

  describe "following" do
    let!(:other_user) { Fabricate(:user) }
    before { @user.follow!(other_user) }

    it { should be_following(other_user) }
    its(:followed_users) { should include(other_user) }

    describe "followed user" do
      subject { other_user }
      its(:followers) { should include(@user) }
    end

    describe "and unfollowing" do
      before { @user.unfollow!(other_user) }

      it { should_not be_following(other_user) }
      its(:followed_users) { should_not include(other_user) }
    end
  end
end
