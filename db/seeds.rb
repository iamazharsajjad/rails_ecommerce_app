# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Product.first_or_create(
  [
    { title: 'Product 1', description: 'Product 1 Description', price: 10, currency: '$' },
    { title: 'Product 2', description: 'Product 2 Description', price: 20, currency: '$' },
    { title: 'Product 3', description: 'Product 3 Description', price: 30, currency: '$' },
    { title: 'Product 4', description: 'Product 4 Description', price: 40, currency: '$' }
  ]
)

Product.all.each do |product|
  product.images.attach(
    io: File.open(File.join(Rails.root, 'app/assets/images/pic01.jpg')),
    filename: 'pic01.jpg'
  )
end
if Rails.env.development?
  AdminUser.create!(email: 'admin@example.com', password: 'password',
                    password_confirmation: 'password')
end
