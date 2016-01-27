class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.page(params[:page]).per(25)
  end

  def show
    @user = User.find(params[:id])
    @user_friend = UserFriend.find_by(user: @user, friend: current_user)
    @user_match = UserMatch.find_by(user: current_user, match: @user)
  end
end
