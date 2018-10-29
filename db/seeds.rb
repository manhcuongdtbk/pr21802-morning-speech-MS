location_name = ["FIZZ", "BUZZ", "18F", "HANDICO OFFICE", "LABORATORY OFFICE"]
location_name.length.times do |n|
  Location.create! name: location_name[n]
end

User.create!(name: "Foo Bar", email: "foo@bar.com", password: "foobar",
  password_confirmation: "foobar",
  location_id: rand(Location.first.id..Location.last.id)).add_role :admin

69.times do |n|
  name  = Faker::Name.unique.name
  email = "foo#{n+1}@bar.com"
  password = "password"
  User.create!(name: name, email: email, password: password,
    password_confirmation: password,
    location_id: rand(Location.first.id..Location.last.id))
end

12.times do
  title  = Faker::Book.genre
  Theme.create! title: title
end

69.times do |n|
  title  = Faker::Book.title
  content = Faker::Lorem.paragraph 50, false, 20
  speaking_day = Faker::Time.forward(n+1, :morning)
  n % 2 == 0 ? status = 0 : status = 1
  location_id = rand(Location.first.id..Location.last.id)
  user_id = rand(User.first.id..User.last.id)
  Speech.create!(title: title, content: content, speaking_day: speaking_day,
    status: status, location_id: location_id, user_id: user_id)
end

69.times do |n|
  speech_id = n + 1
  theme_id = rand(Theme.first.id..Theme.last.id)
  SpeechTheme.create!(speech_id: speech_id, theme_id: theme_id)
end
