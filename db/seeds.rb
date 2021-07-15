# frozen_string_literal: true

10.times do |_|
  User.create!(name: FFaker::Name.name, email: FFaker::Internet.email)
end

100.times do |_|
  product = Product.create!(brand: FFaker::Product.brand, name: FFaker::Product.product)

  User.find(rand(1..10)).add_role(:admin, product)
end

1000.times do |_|
  Purchase.create!(price: rand(1..100), product_id: rand(1..100), buyer_id: rand(1..10), seller_id: rand(1..10))
end

puts "Created user '#{User.first.email}'"
