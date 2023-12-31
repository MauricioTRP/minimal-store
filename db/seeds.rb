# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Product.delete_all

puts "Create products"
20.times do
  Product.create(
    title: Faker::Commerce.product_name,
    description: Faker::Lorem.paragraphs(number: 10).join(', '),
    price: 9.99
  )
end

puts "Create Admin"

User.create(
  email: 'admin@example.com',
  rut: '12345678-5',
  name: 'admin',
  last_name: 'example',
  phone: '954625741',
  password: 123456,
  password_confirmation: 123456
)
