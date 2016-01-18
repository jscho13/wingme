class User < ActiveRecord::Base
  has_many :friends, class_name: "User",
                          foreign_key: "users_friend_id"
  # has_many :matches, class_name: "User",
  #                         foreign_key: "match_id"
end
