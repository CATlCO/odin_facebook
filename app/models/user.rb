class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and 
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :name
  has_many :posts, -> { order('created_at DESC')}
	has_many :friendships, dependent: :destroy
	has_many :friends, -> { where(friendships: { accepted: true }) }, through: :friendships, dependent: :destroy
	has_many :inv_friendships, class_name: "Friendship", foreign_key: "friend_id", dependent: :destroy
	has_many :inv_friends, -> { where(friendships: { accepted: true }) }, through: :inv_friendships, source: "user", dependent: :destroy
	has_many :likes
	has_many :comments

	def all_friends
		self.friends + self.inv_friends
	end

	def friend?(user)
		self.friends.include?(user)
	end

	def inv_friend?(user)
		self.inv_friends.include?(user)
	end

	def stranger?(user)
		!self.friend?(user)
	end

	def request_sent?(user)
		self.friendships.any? { |f| f.friend_id == user.id && !f.accepted}
	end

	def request_received?(user)
		self.inv_friendships.any? { |f| f.user_id == user.id && !f.accepted}
	end

	def pending_requests
		self.inv_friendships.where(accepted: false)
	end
end
