require 'spec_helper'

describe AnswersController do
  context "un-authenticated users" do
    describe "POST create" do
      it_behaves_like "require_sign_in" do
        topic = Fabricate(:topic)
        let(:action) { post :create, topic_id: topic, answer: {body: "hello", referred_subject: "first"} }
      end
    end
  end

  context "authenticated users" do
  #   login_user

  #   describe "GET show" do
  #     it "renders the show page" do
  #       topic = Fabricate(:topic)
  #       get :show, id: topic.id
  #       response.should render_template :show
  #     end

  #     it "assigns @topic" do
  #       topic = Fabricate(:topic)
  #       get :show, id: topic.id
  #       assigns(:topic).should eq(topic)
  #     end
  #   end
  end
end
