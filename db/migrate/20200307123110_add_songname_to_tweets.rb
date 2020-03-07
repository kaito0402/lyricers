class AddSongnameToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :song_name, :string
  end
end
