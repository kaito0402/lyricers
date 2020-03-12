class Tweet < ApplicationRecord
  validates :lyric, presence: true
  validates :text, presence: true
  belongs_to :user
  has_many :comments
end
