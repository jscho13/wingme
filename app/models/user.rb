class User < ActiveRecord::Base
  include ApplicationHelper
  GENDERS = ["Male", "Female", "Other"].freeze
  mount_uploader :picture, PictureUploader
  has_many :friends
  has_many :users, through: :friends
  has_many :matches
  has_many :users, through: :matches
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :gender, presence: true, inclusion: { in: GENDERS }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  def friend_list
    friend_list = []
    unless self.friends.empty?
      self.friends.where(pending: false).each do |friend|
        friend_list << User.find(friend.users_friend_id)
      end
    end
    friend_list
  end

  def match_list
    # Alternative syntax to find all matches for a single user
    # match_list = Match.where(user_id: "#{user_id}")
    match_list = []
    unless self.matches.empty?
      self.matches.where(pending: false).each do |match|
        # This creates a list of users, found by their user_id
        match_list << User.find(match.users_match_id)
      end
    end
    match_list
  end

  def pending_friends_list
    pending_list = []
    Friend.where(user_id: self.id, pending: true).each do |friend|
      pending_list << User.find(friend.users_friend_id)
    end
    pending_list
  end

  def pending_friend_request_list
    pending_list = []
    Friend.where(users_friend_id: self.id, pending: true).each do |friend|
      pending_list << User.find(friend.user_id)
    end
    pending_list
  end

  def pending_matches_list
    pending_list = []
    Match.where(user_id: self.id, pending: true).each do |match|
      pending_list << User.find(match.users_friend_id)
    end
    pending_list
  end

  def pending_match_request_list
    pending_list = []
    Match.where(users_match_id: self.id, pending: true).each do |match|
      pending_list << User.find(match.user_id)
    end
    pending_list
  end
end
