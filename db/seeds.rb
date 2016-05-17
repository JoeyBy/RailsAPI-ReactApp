require 'faker'

10.times do
  User.create(email: Faker::Internet.email, username: Faker::Internet.user_name, password: 'password')
end
  User.create(email: 'joey.byrne@outlook.com', username: 'JoeyBoey', password: 'MOJO1991')

10.times do
  Task.create(title: Faker::Name.title, body: Faker::Lorem.paragraph(30 + rand(70)), user: User.all.sample)
end
