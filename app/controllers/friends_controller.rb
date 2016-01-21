class FriendsController < ApplicationController

  def new
    Friend.create(user_id: current_user.id,
                  users_friend_id: params[:format],
                  pending: true)
    redirect_to user_path(current_user)
  end

  def update
    friend_row = Friend.find(params[:id])
    friend_row.update(pending: 'false')
    redirect_to user_path(current_user)
  end
end
