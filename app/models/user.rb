class User < ActiveRecord::Base
  has_many :friends, class_name: "User",
                          foreign_key: "users_friend_id"
  # has_many :matches, class_name: "User",
  #                         foreign_key: "users_match_id"

  def self.friend_list(user_id)
    friends = []
    friend_list = Friend.where(user_id: "#{user_id}")
    friend_list.each do |friend|
      # We want a list of users, found by their user_id
      friends << User.find(friend.users_friend_id)
    end
    friends
  end

  def self.match_list(user_id)
    friends = []
    friend_list = Friend.where(user_id: "#{user_id}")
    friend_list.each do |friend|
      # We want a list of users, found by their user_id
      friends << User.find(friend.users_friend_id)
    end
    friends
  end

end
