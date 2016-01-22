class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    redirect_to user_path(current_user)
  end

  def show
    @user = User.find(params[:id])
    @users = User.all
    @user_friend = UserFriend.find_by(user: @user, friend: current_user)
    @user_match = UserMatch.find_by(user: current_user, match: @user)
  end
end
