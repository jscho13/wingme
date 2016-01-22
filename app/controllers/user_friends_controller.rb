class UserFriendsController < ApplicationController
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
    new_friendship = UserFriend.create!(user: current_user, friend: user, pending: false)
    redirect_to user_path(current_user)
  end
end
