require 'spec_helper'

describe CommentsController do
  context "un-authenticated users" do
    describe "POST create" do
      it_behaves_like "require_sign_in" do
        answer = Fabricate(:answer)
        let(:action) { post :create, answer_id: answer, comment: {body: "hello"} }
      end
    end
  end

  context "authenticated users" do
    login_user

    describe "GET new" do
      it "assigns @answer and @comment" do
        answer = Fabricate(:answer)
        xhr :get, :new, answer_id: answer.id
        expect(assigns(:comment)).to be_a_new(Comment)
        expect(assigns(:answer)).to eq(answer)
      end
    end

    describe "creating a comment with Ajax" do
      let(:answer) { Fabricate(:answer) }

      it "should increment the Comments count" do
        expect do
          xhr :post, :create, comment: { body: "body" }, answer_id: answer.id
        end.to change(Comment, :count).by(1)
      end

      it "should respond with success" do
        xhr :post, :create, comment: { body: "body" }, answer_id: answer.id
        expect(response).to be_success
      end

      it "assigns the comment to the current user" do
        expect do
          xhr :post, :create, comment: { body: "body" }, answer_id: answer.id
        end.to change(subject.current_user.comments, :count).by(1)
      end

      it "creates new activity assigned to user" do
        xhr :post, :create, comment: { body: "body" }, answer_id: answer.id
        expect(PublicActivity::Activity.last.owner).to eq(subject.current_user)
      end
    end
  end
end
