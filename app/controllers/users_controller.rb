class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    redirect_to user_path(current_user)
  end

  def show
    user = User.find(params[:id])
    @users = User.all
    @matches = User.match_list(user)
    @friends = User.friend_list(user)
  end

end
