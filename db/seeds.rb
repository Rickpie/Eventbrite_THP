require 'faker'
=begin
10.times do
  user = User.create!(email: Faker::Internet.free_email, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Lorem.paragraph_by_chars)
end
=end

10.times do
event = Event.create!(
  start_date: Time.now + rand(1..30).days,
  duration: rand(1..6) * 5,
  title: Faker::Lorem.sentence(word_count: rand(3..10)),
  description: Faker::Lorem.paragraph_by_chars(number: rand(20..1000)),
  price: rand(1..1000),
  location: Faker::Address.full_address
)
end