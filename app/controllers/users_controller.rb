class UsersController < ApplicationController

  def show
    @user = User.friendly.find(params[:id])
    @topics = @user.topics
  end

end
