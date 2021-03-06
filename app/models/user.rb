require 'open-uri'

class User < ActiveRecord::Base
  include ApplicationHelper
  GENDERS = ["Male", "Female", "Other"].freeze
  mount_uploader :picture, PictureUploader
  has_many :user_friends,
    -> { where(pending: false) }
  has_many :friends,
    through: :user_friends

  has_many :requested_user_friends,
    -> { where(pending: true) },
    class_name: "UserFriend"
  has_many :requested_friends,
    through: :requested_user_friends,
    source: :friend

  has_many :requested_by_user_friends,
    -> { where(pending: true) },
    class_name: "UserFriend",
    foreign_key: :friend_id
  has_many :requested_by_friends,
    through: :requested_by_user_friends,
    source: :user

  has_many :user_matches,
    -> { where(pending: false, pending_acceptance: false) }
  has_many :matches,
    through: :user_matches

  has_many :requested_user_matches,
    -> { where(pending: true) },
    class_name: "UserMatch"
  has_many :requested_matches,
    through: :requested_user_matches,
    source: :match

  has_many :requested_by_user_matches,
    -> { where(pending_acceptance: true) },
    class_name: "UserMatch",
    foreign_key: :match_id
  has_many :requested_by_matches,
    through: :requested_by_user_matches,
    source: :user

  has_many :pending_match_requests,
    -> { where(pending: false, pending_acceptance: true) },
    class_name: "UserMatch"
  has_many :pending_matches,
    through: :pending_match_requests,
    source: :match

  validates :name, presence: true
  validates :email, presence: true
  validates :gender, presence: true, inclusion: { in: GENDERS }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name
      user.remote_picture_url = auth.info.image.gsub('http://', 'https://')
      user.gender = auth.extra.raw_info.gender
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"]
        user.name = data["info"]["name"] if user.name.blank?
        user.email = data["info"]["email"] if user.email.blank?
        gender = data["extra"]["raw_info"]["gender"]
        user.gender = gender[0].upcase + gender[1..-1] if user.gender.blank?
        url = data["info"]["image"]
        user.remote_picture_url = url.gsub('http://', 'https://')
      end
    end
  end

  def pending_friend?(user)
    requested_friends.include?(user)
  end

  def friend_request_sent_by?(user)
    requested_by_friends.include?(user)
  end

  def friend?(user)
    friends.include?(user)
  end

  def pending_match?(user)
    pending_matches.include?(user)
  end

  def match_request_sent_by?(user)
    requested_by_matches.include?(user)
  end

  def match?(user)
    matches.include?(user)
  end

  def minus_friend(user)
    friends - [User.find(user)]
  end
end
