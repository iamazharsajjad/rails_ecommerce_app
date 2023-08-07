# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Product.first_or_create(
#   [
#     (1..50).each do |i|
#       { title: "Product #{i}", description: "Product #{i} Description", price:  Random.rand(30..60), currency: '$' }
#     end
#   ]
# )

if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password',
                    password_confirmation: 'password')

  (1..50).each do |i|
    Product.create!(
      { title: "Product #{i}", description: "Product #{i} Description", price: Random.rand(30..60), currency: '$' }
    )
  end

  Product.all.each do |product|
    product.images.attach(
      io: File.open(File.join(Rails.root, 'app/assets/images/pic01.jpg')),
      filename: 'pic01.jpg'
    )
  end
end
