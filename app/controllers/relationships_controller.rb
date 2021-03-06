class RelationshipsController < ApplicationController

  before_action :authenticate_user!, except: [:create, :destroy]

  def create
    @user = User.find(params[:relationship][:followed_id])
    @relationship = current_user.follow!(@user)
    @relationship.create_activity :create, owner: current_user, recipient: @user if @relationship
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
end
