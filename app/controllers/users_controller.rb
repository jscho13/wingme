class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    redirect_to user_path(current_user)
  end

  def show
    user = User.find(params[:id])
    @users = User.all
    @matches = user.match_list
    @friends = user.friend_list
    @pending_friend_request_list = user.pending_friend_request_list if current_user == user
    @pending_match_request_list = user.pending_match_request_list if current_user == user
  end
end
