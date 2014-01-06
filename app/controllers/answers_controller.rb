class AnswersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def create
    topic = Topic.friendly.find(params[:topic_id])
    @answer = current_user.answers.build(answer_params.merge(topic_id: topic.id))
    require 'pry'; binding.pry
  end

  private

  def answer_params
    params.require(:answer).permit(:body)
  end
end
