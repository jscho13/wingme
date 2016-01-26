class HomeController < ApplicationController
  def index
    render layout: false
  end

  def show
    @user = User.all.sample
    @user_friend = UserFriend.find_by(user: @user, friend: current_user)
    @user_match = UserMatch.find_by(user: current_user, match: @user)
  end
end
