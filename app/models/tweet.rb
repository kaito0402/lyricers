class Tweet < ApplicationRecord
  validates :lyric, presence: true
  validates :text, presence: true
  belongs_to :user
  has_many :comments

  def self.search(search)
    return Tweet.all unless search
    Tweet.where('lyric LIKE(?) OR artist LIKE(?) OR song_name LIKE(?)',"%#{search}%","%#{search}%","%#{search}%")
  end
end
