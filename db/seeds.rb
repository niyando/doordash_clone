# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create do |u|
  u.name = Faker::Name.name
  u.email = "niyando@gmail.com"
  u.password = "password123"
end

user_cart = user.create_cart

# 20.times do |n|
#   Item.create do |i|
#     i.name = Faker::Food.dish
#     i.description = Faker::Food.description
#     i.amount = (5..20).to_a.sample
#   end
# end

3.times do |n|
  user_cart.cart_items.create(item: Item.all.sample, quantity: 1)
end

