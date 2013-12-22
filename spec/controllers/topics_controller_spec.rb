require 'spec_helper'

describe TopicsController do
  context "un-authenticated users" do
    describe "GET index" do
      it "assigns @topics to all topics" do
        topics = Fabricate.times(4, :topic)
        get :index
        expect(assigns(:topics)).to eq(topics)
      end
    end

    describe "GET :new" do
      it_behaves_like "require_sign_in" do
        let(:action) { get :new }
      end
    end
  end

  context "authenticated users" do
    before do
      @user = Fabricate(:user)
      sign_in @user
    end

    describe "GET show" do
      it "renders the show page" do
        topic = Fabricate(:topic)
        get :show, id: topic.id
        response.should render_template :show
      end

      it "assigns @topic" do
        topic = Fabricate(:topic)
        get :show, id: topic.id
        assigns(:topic).should eq(topic)
      end
    end

    describe "POST create" do
      it_behaves_like "require_sign_in" do
        let(:action) { post :create, topic: Fabricate.attributes_for(:topic) }
      end
    end
  end
end
