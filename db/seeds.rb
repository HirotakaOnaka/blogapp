10.times do |n|
  title = Faker::Music.band
  content = Faker::RockBand.name
  user_id = "142"
  image = Faker::Avatar.image
  Blog.create!(title: title,
               content: content,
               user_id: user_id,
               image: image
               )
end