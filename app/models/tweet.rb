class Tweet < ApplicationRecord
  validates :lyric, presence: true
  validates :text, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :tweet
  def self.search(search)
    return Tweet.all unless search
    Tweet.where('lyric LIKE(?) OR artist LIKE(?) OR song_name LIKE(?)',"%#{search}%","%#{search}%","%#{search}%")
  end
end


