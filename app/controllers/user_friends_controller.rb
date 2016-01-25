class UserFriendsController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:id] != nil
      @user = User.find(params[:id])
    else
      @user = current_user
    end
  end

  def create
    friend = User.find(params[:user_id])
    UserFriend.create!(
      user: current_user,
      friend: friend
    )
    redirect_to user_path(current_user)
  end

  def update
    user = User.find(params[:user_id])
    old_friendship = UserFriend.find_by(user: user, friend: current_user)
    old_friendship.update!(pending: "false")
    UserFriend.create!(user: current_user, friend: user, pending: false)
    redirect_to user_path(current_user)
  end
end
