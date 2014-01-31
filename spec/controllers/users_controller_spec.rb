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
      expect(assigns(:topics)).to eq(user.topics)
    end
  end
end
