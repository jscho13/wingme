class FriendsController < ApplicationController

  def new
    Friend.create(user_id: current_user.id, users_friend_id: params[:format])
    redirect_to user_path(current_user)
  end
end
