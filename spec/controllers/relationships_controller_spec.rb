require 'spec_helper'

describe RelationshipsController do

  let(:user) { Fabricate(:user) }
  let(:other_user) { Fabricate(:user) }

  before { sign_in user }

  describe "creating a relationship with Ajax" do

    it "should increment the Relationship count" do
      expect do
        xhr :post, :create, relationship: { followed_id: other_user.id }
      end.to change(Relationship, :count).by(1)
    end

    it "should respond with success" do
      xhr :post, :create, relationship: { followed_id: other_user.id }
      expect(response).to be_success
    end

    it "creates new activity assigned to user and recipient" do
      xhr :post, :create, relationship: { followed_id: other_user.id }
      expect(PublicActivity::Activity.last.owner).to eq(user)
      expect(PublicActivity::Activity.last.recipient).to eql(other_user)
    end
  end

  describe "destroying a relationship with Ajax" do

    before { user.follow!(other_user) }
    let(:relationship) do
      user.relationships.find_by(followed_id: other_user.id)
    end

    it "should decrement the Relationship count" do
      expect do
        xhr :delete, :destroy, id: relationship.id
      end.to change(Relationship, :count).by(-1)
    end

    it "should respond with success" do
      xhr :delete, :destroy, id: relationship.id
      expect(response).to be_success
    end
  end
end
