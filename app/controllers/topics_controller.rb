class TopicsController < ApplicationController
  before_action :set_topic, only: [:show, :edit]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def edit
  end

  def show
  end

  def create
    @topic = current_user.topics.build(topic_params)
    if @topic.save
      redirect_to @topic, notice: 'Topic was successfully created.'
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
