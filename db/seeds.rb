location_name = ["Laboratory", "Handico", "Kaeng Nam"]
Location.create! name: location_name[0]
Location.create! name: location_name[1]
Location.create! name: location_name[2]

User.create!(name: "Foo Bar", email: "foo@bar.com", password: "foobar",
  password_confirmation: "foobar").add_role :admin

69.times do |n|
  name  = Faker::Name.unique.name
  email = "foo#{n+1}@bar.com"
  password = "password"
  User.create!(name: name, email: email, password: password,
    password_confirmation: password)
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
  location_id = rand(1..3)
  user_id = rand(1..70)
  Speech.create!(title: title, content: content, speaking_day: speaking_day,
    status: status, location_id: location_id, user_id: user_id)
end

69.times do |n|
  speech_id = n + 1
  theme_id = rand(1..12)
  SpeechTheme.create!(speech_id: speech_id, theme_id: theme_id)
end
