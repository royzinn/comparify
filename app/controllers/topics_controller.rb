class TopicsController < ApplicationController
  before_action :set_topic, only: [:show]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    if params[:tag]
      @topics = Topic.tagged_with(params[:tag])
    else
      @topics = Topic.all
    end
  end

  def new
    @topic = Topic.new
  end

  def show
    @first_subject_answers = @topic.answers.supports_first_subject
    @second_subject_answers = @topic.answers.supports_second_subject
    @answer = Answer.new
    @tags = @topic.tag_list
  end

  def create
    @topic = current_user.topics.build(topic_params)
    @topic.tag_list.add(params[:tag_list], parse: true) if params[:tag_list]
    if @topic.save
      @topic.create_activity :create, owner: current_user
      redirect_to @topic, notice: "Done, now let's sit and wait for answers..."
    else
      render action: 'new'
    end
  end

  def autocomplete_tags
    redirect_to home_path
  end

  private

  def set_topic
    @topic ||= Topic.friendly.find(params[:id])
  end

  def topic_params
    params.require(:topic).permit(:first_subject, :second_subject, :question, :category_id)
  end
end
