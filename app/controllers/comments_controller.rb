class CommentsController < ApplicationController
  include FormatHelper
  before_action :authenticate_user!, only: [:create, :new]

  respond_to :html, :js, :json, except: :new

  def new
    @answer = Answer.find(params[:answer_id])
    @comment = Comment.new

    respond_to do |format|
      format.html { render layout: !request.xhr? }
      format.js
    end
  end

  def create
    @answer = Answer.find(params[:answer_id])
    @comment = current_user.comments.new(comment_params)

    flash[:notice] = "Thanks! your comment was added" if @comment.save
    @comment.create_activity :create, owner: current_user if @comment.persisted?
    respond_with( @comment, :layout => !request.xhr? )
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
