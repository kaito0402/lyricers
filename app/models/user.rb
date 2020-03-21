class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  validates :email, presence: true
  has_many :tweets
  has_many :comments
  has_many :likes
  has_many :liked_tweets, through: :likes, source: :tweet
  def already_liked?(tweet)
    self.likes.exists?(tweet_id: tweet.id)
  end
end
