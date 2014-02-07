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

    describe "POST create" do
      it_behaves_like "require_sign_in" do
        let(:action) { post :create, topic: Fabricate.attributes_for(:topic) }
      end
    end
  end

  context "authenticated users" do
    login_user

    describe "POST create" do
      context "with valid topic" do
        it "creates new topic" do
          post :create, topic: Fabricate.attributes_for(:topic)
          expect(subject.current_user.topics.count).to eq(1)
          expect(response).to redirect_to topic_path(Topic.last.friendly_id)
        end
      end
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

      it "assigns @first_subject_answers and @second_subject_answers" do
        topic = Fabricate(:topic)
        roy = Fabricate(:user)
        roy_ans = Answer.create!(body: "some answer", referred_subject: "first", topic: topic, user: roy)
        joy = Fabricate(:user)
        joy_ans = Answer.create!(body: "some answer", referred_subject: "first", topic: topic, user: joy)
        toy = Fabricate(:user)
        toy_ans = Answer.create!(body: "some answer", referred_subject: "second", topic: topic, user: toy)
        noy = Fabricate(:user)
        noy_ans = Answer.create!(body: "some answer", referred_subject: "second", topic: topic, user: noy)

        get :show, id: topic.id
        assigns(:first_subject_answers).should eq([roy_ans, joy_ans])
        assigns(:second_subject_answers).should eq([toy_ans, noy_ans])
      end
    end
  end
end
