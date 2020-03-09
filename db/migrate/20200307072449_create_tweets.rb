class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.text :lyric, null: false
      t.string :artist
      t.text :link
      t.text :text, null: false
      t.timestamps null: false
    end
  end
end
