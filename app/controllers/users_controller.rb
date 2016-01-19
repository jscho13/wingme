class UsersController < ApplicationController
before_action :authenticate_user!

  def index
    redirect_to user_path(current_user)
  end

  def show
    user_id = params[:id]
    @users = User.all
    @matches = User.match_list(user_id)
    @friends = User.friend_list(user_id)
  end

end
