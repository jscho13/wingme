class MatchesController < ApplicationController
  def new
    @matched_user = params[:user_id]
    @friends = current_user.friend_list
  end

  def create
    Match.create(user_id: params[:user_to_match],
                  users_match_id: params[:user_id],
                  pending: true)
    redirect_to user_path(params[:user_to_match])
  end

  def update
    match_row = Match.find(params[:id])
    match_row.update(pending: 'false')
    redirect_to user_path(current_user)
  end
end
