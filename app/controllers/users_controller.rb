class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @friends = []
    friend_list = Friend.where(user_id: "#{params[:id]}")
    friend_list.each do |friend|
      # We want a list of users, found by their user_id
      @friends << User.find(friend.users_friend_id)
    end
  end

end
