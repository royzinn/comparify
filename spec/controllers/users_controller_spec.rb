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

    it "assigns topics" do
      get :show, id: User.first.id
      expect(PublicActivity::Activity.where(owner: user)).to eq(PublicActivity::Activity.first(3))
    end
  end
end
