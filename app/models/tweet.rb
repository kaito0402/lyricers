class Tweet < ApplicationRecord
  validates :lyric, presence: true
  validates :text, presence: true
end
