json.array! @tweets do |tweet|
  json.id tweet.id
  json.lyric tweet.lyric
  json.artist tweet.artist
  json.link tweet.link
  json.text tweet.text
  json.song_name tweet.song_name
  json.likes tweet.likes.count
end
