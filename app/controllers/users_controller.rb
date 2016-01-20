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
  end
end
