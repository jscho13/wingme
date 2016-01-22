class UserMatch < ActiveRecord::Base
  belongs_to :user
  belongs_to :match,
    class_name: "User"

  validates :user, presence: true
  validates :match, presence: true
end
