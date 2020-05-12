# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


10.times do
    event = Event.create!(
      start_date: Faker::Date.forward(days: 23),
      duration: Faker::Number.between(from: 1, to: 90),
      title: Faker::Book.title,
      description: Faker::TvShows::Community.quotes,
      price: rand(18..28),
      location: Faker::Address.street_address
    )
  end