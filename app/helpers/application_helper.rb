module ApplicationHelper
  def new_person?
    user = User.find(params[:id])
    if current_user.friends.include?(user)
      return false
    elsif current_user == user
      return false
    else
      return true
    end
  end
end
