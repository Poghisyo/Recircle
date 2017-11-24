# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'cleaning database'
Purchase.destroy_all
Material.destroy_all
User.destroy_all


puts 'Creating 86 fake users with material...'
86.times do
  user = User.new({
    email: Faker::Internet.email,
    password: Faker::Vehicle.vin
    })
  user.save!

  material = Material.new({
    seller: user,
    # category: Faker::Commerce.material,
    category: ["wood", "plastic", "paper", "glass", "organic", "construction", "food"].sample,
    title: Faker::Commerce.product_name,
    price: Faker::Number.between(20, 3000),
    supplier: Faker::Company.name,
    created_at: Faker::Date.between(20.days.ago, Date.today),
    description: Faker::Lorem.paragraph,
    # address: Faker::Address.city
    address: ["amsterdam", "rotterdam", "leiden", "naarden", "den haag", "amstelveen", "dordrecht", "utrecht", "breda", "antwerpen", "venlo", "bilthoven"].sample
    })
  material.save!

end
