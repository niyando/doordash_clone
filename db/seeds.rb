
user = User.create! do |u|
  u.name = Faker::Name.name
  u.email = "niyando@gmail.com"
  u.password = "password123"
end

user_cart = user.create_cart

20.times do |n|
  Item.create do |i|
    i.name = Faker::Food.dish
    i.description = Faker::Food.description
    i.amount = (5..20).to_a.sample
  end
end

3.times do |n|
  user_cart.cart_items.create(item: Item.all.sample, quantity: 1)
end

user_group_cart = user.create_group_cart

user_2 = User.create do |u|
  u.name = Faker::Name.name
  u.email = "niyando+2@gmail.com"
  u.password = "password123"
end

user_3 = User.create do |u|
  u.name = Faker::Name.name
  u.email = "niyando+3@gmail.com"
  u.password = "password123"
end

8.times do |i|
  user_group_cart.group_cart_items.create! do |gc|
    gc.user = [user, user_2, user_3].sample
    gc.item = Item.all.sample
    gc.quantity = 1
  end
end