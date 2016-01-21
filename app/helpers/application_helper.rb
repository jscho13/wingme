module ApplicationHelper
  def add_friend?
    user = User.find(params[:id])
    if current_user.friend_list.include?(user)
      return false
    elsif current_user.pending_friends_list.include?(user)
      return false
    elsif current_user.pending_friend_request_list.include?(user)
      return false
    elsif current_user == user
      return false
    else
      return true
    end
  end

  def pending_friend?
    user = User.find(params[:id])
    if current_user.pending_friends_list.include?(user)
      return true
    else
      return false
    end
  end

  def confirm_friend
    user = User.find(params[:id])
    if current_user.pending_friend_request_list.include?(user)
      confirm_id = Friend.where(user_id: user, users_friend_id: current_user.id, pending: true).first.id
      friend = Friend.find(confirm_id)
      return friend
    else
      return false
    end
  end

  def add_match?
    user = User.find(params[:id])
    if current_user.match_list.include?(user)
      return false
    elsif current_user.pending_matches_list.include?(user)
      return false
    elsif current_user.pending_match_request_list.include?(user)
      return false
    elsif current_user == user
      return false
    else
      return true
    end
  end

  def pending_match?
    user = User.find(params[:id])
    if current_user.pending_matches_list.include?(user)
      return true
    else
      return false
    end
  end

  def confirm_match
    user = User.find(params[:id])
    if current_user.pending_match_request_list.include?(user)
      confirm_id = Match.where(user_id: user, users_match_id: current_user.id, pending: true).first.id
      match = Match.find(confirm_id)
      return match
    else
      return false
    end
  end
end
