require 'rails_helper'
describe Tweet do
  describe '#create' do
    it "lyricが空だと保存されない" do
      tweet = build(:tweet, lyric: "")
      tweet.valid?
      expect(tweet.errors[:lyric]).to include("can't be blank")
    end
    it "textが空だと保存されない" do
      tweet = build(:tweet, text: "")
      tweet.valid?
      expect(tweet.errors[:text]).to include("can't be blank")
    end
    it "全てあれば保存される" do
      
      tweet = build(:tweet)
      expect(tweet).to be_valid
    end
  end
end