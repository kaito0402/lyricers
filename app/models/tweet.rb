class Tweet < ApplicationRecord
  VALID_YOUTUBE_URL = /(\Ahttps:\/\/www\.youtube\.com\/watch\?v=)+[\w]{11}\z/
  validates :link, format: { with: VALID_YOUTUBE_URL }
  validates :lyric, :text, presence: true
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :tweet
  def self.search(search)
    return Tweet.all unless search
    Tweet.where('lyric LIKE(?) OR artist LIKE(?) OR song_name LIKE(?)',"%#{search}%","%#{search}%","%#{search}%")
  end
end


