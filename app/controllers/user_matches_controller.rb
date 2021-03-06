class UserMatchesController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:id] != nil
      @user = User.find(params[:id])
    else
      @user = current_user
    end
  end

  def new
    @selected_user = params[:user_id]
  end

  def create
    UserMatch.create(user_id: params[:user_id],
                     match_id: params[:matched_user],
                     pending: true,
                     pending_acceptance: true)
    UserMatch.create(user_id: params[:matched_user],
                     match_id: params[:user_id],
                     pending: true,
                     pending_acceptance: true)
    redirect_to users_path
  end

  def update
    old_relationship_1 = UserMatch.find(params[:id])
    user = User.find(old_relationship_1.user_id)
    match = User.find(old_relationship_1.match_id)
    old_relationship_1.update!(pending: "false")
    old_relationship_2 = UserMatch.find_by(user: match, match: user)
    old_relationship_2.update!(pending_acceptance: "false")
    redirect_to user_path(current_user)
  end
end
