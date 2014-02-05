class UsersController < ApplicationController

  def show
    @user = User.friendly.find(params[:id])
    @activities = PublicActivity::Activity.order("created_at DESC").where('(owner_type = "User" and owner_id = :user) or (recipient_type = "User" and recipient_id = :user)', {user: @user}).all
  end

end
