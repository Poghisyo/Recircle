# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'cleaning database'
Material.destroy_all
User.destroy_all


puts 'Creating 20 fake users with material...'
20.times do
  user = User.new({
    email: Faker::Internet.email,
    password: Faker::Vehicle.vin
    })
  user.save!

  material = Material.new({
    seller: user,
    category: Faker::Commerce.material,
    title: Faker::Commerce.product_name,
    price: Faker::Number.between(20, 3000),
    supplier: Faker::Ancient.hero,
    created_at: Faker::Date.between(20.days.ago, Date.today),
    address: Faker::Address.city
    })
  material.save!

end
