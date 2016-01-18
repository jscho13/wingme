class UsersController < ApplicationController

  def index
    #this page doesnt need to exist
  end

  def show
    user_id = params[:id]
    @friends = User.friend_list(user_id)
  end

end
