# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Restaurant.destroy_all

10.times do
  category = %w(chinese italian japanese french belgian).sample

  resto = Restaurant.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: "#{Faker::PhoneNumber.cell_phone_in_e164}",
    category: category
  )
  puts resto[:name]
  resto.save!

    10.times do
      review = Review.new(
        content: Faker::Lorem.paragraphs,
        rating: rand(1..5)
      )
      review.restaurant = resto
      puts review[:rating]
      review.save!
    end
end
