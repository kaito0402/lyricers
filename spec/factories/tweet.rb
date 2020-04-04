FactoryBot.define do
  
  factory :tweet do
    lyric {"このままで愛されてる喜びに出会った"}
    artist {"kaito"}
    link {"oooooooooooooooo"}
    text {"いいね"}
    song_name {"このままで"}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    user
  end
end