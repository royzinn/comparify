class TopicsController < ApplicationController
  before_action :set_topic, only: [:show]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def show
    @first_subject_answers = @topic.answers.supports_first_subject
    @second_subject_answers = @topic.answers.supports_second_subject
    @answer = Answer.new
  end

  def create
    @topic = current_user.topics.build(topic_params)
    if @topic.save
      @topic.create_activity :create, owner: current_user
      redirect_to @topic, notice: "Done, now let's sit and wait for answers..."
    else
      render action: 'new'
    end
  end

  private

  def set_topic
    @topic ||= Topic.friendly.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:first_subject, :second_subject, :question)
  end
end
