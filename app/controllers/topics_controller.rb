class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def new
    @topic = Topic.new
  end

  def edit
  end

  def show
  end

  private

  def set_topic
    @topic ||= Topic.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:first_subject, :second_subject, :question)
  end
end
