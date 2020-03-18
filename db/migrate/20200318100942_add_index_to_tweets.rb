class AddIndexToTweets < ActiveRecord::Migration[5.2]
  def change
    add_index :tweets, [:lyric, :artist, :song_name], length:64
  end
end
