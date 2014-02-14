class AnswersController < ApplicationController
  include FormatHelper
  before_action :authenticate_user!, except: [:show]

  def create
    @topic = Topic.friendly.find(params[:topic_id])
    @answer = current_user.answers.create(answer_params.merge(topic_id: @topic.id))
    @answer.create_activity :create, owner: current_user if @answer.persisted?
    respond_to do |format|
      format.html { redirect_to @topic }
      format.js
    end
  end

  def destroy

  end

  private

  def answer_params
    params.require(:answer).permit(:body, :referred_subject)
  end
end
