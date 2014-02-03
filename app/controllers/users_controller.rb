class UsersController < ApplicationController

  def show
    @user = User.friendly.find(params[:id])
    @activities = PublicActivity::Activity.order("created_at DESC").where(owner_type: "User", owner_id: current_user).all
  end

end
