location_name = ["FIZZ", "BUZZ", "18F", "HANDICO OFFICE", "LABORATORY OFFICE"]
location_name.length.times do |n|
  Location.create! name: location_name[n]
end

User.create!(name: "Foo Bar", email: "foo@bar.com", password: "foobar",
  password_confirmation: "foobar",
  location_id: rand(Location.first.id..Location.last.id)).add_role :admin

69.times do |n|
  User.create!(name: Faker::Name.unique.name, email: "foo#{n+1}@bar.com",
    password: "password", password_confirmation: "password",
    location_id: rand(Location.first.id..Location.last.id))
end

users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each{|followed| user.follow(followed)}
followers.each{|follower| follower.follow(user)}

12.times do
  Theme.create! title: Faker::Book.genre
end

69.times do |n|
  Speech.create!(theme_ids: rand(Theme.first.id..Theme.last.id),
    title: Faker::Book.title, content: Faker::Lorem.paragraph(50, false, 20),
    speaking_day: Faker::Time.forward(n+1, :morning),
    status: (n % 2 == 0 ? status = 0 : status = 1),
    location_id: rand(Location.first.id..Location.last.id),
    user_id: rand(User.first.id..User.last.id))
end

69.times do |n|
  SpeechTheme.create!(speech_id: n + 1,
    theme_id: rand(Theme.first.id..Theme.last.id))
end
