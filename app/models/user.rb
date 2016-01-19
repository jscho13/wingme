class User < ActiveRecord::Base
  has_many :friends, class_name: "User",
                          foreign_key: "users_friend_id"
  has_many :matches, class_name: "User",
                          foreign_key: "users_match_id"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  def self.match_list(user_id)
    matches = []
    match_list = Match.where(user_id: "#{user_id}")
    match_list.each do |match|
      # We want a list of users, found by their user_id
      matches << User.find(match.users_match_id)
    end
    matches
  end

  def self.friend_list(user_id)
    friends = []
    friend_list = Friend.where(user_id: "#{user_id}")
    friend_list.each do |friend|
      # We want a list of users, found by their user_id
      friends << User.find(friend.users_friend_id)
    end
    friends
  end

end
