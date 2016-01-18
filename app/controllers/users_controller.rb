class UsersController < ApplicationController

  def show
    user_id = params[:id]
    @users = User.all
    @matches = User.match_list(user_id)
    @friends = User.friend_list(user_id)
  end

end
