require 'spec_helper'

describe UsersController do

  let(:user) { Fabricate(:user) }
  before { sign_in user }

  describe "#show" do
    before {
      3.times do
        user.topics << Fabricate(:topic)
      end
    }

    it "assigns user" do
      get :show, id: User.first.id
      expect(assigns(:user)).to eq(user)
    end

    it "assigns acitivities" do
      other_user = Fabricate(:user)
      user.follow!(other_user)
      get :show, id: User.first.id
      expect(assigns(:activities)).to eq(PublicActivity::Activity.where(owner_id: user.id).to_a)
    end
  end
end
