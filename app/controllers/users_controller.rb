class UsersController < ApplicationController

  def show
    @user = User.friendly.find(params[:id])
    @activities = PublicActivity::Activity.order("created_at DESC").where('(owner_type = :type and owner_id = :user) or (recipient_type = :type and recipient_id = :user)', {type: User, user: @user}).load
  end

end
