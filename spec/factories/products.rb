# frozen_string_literal: true

# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  currency    :string
#  description :string
#  price       :integer
#  sale_price  :integer
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  stripe_id   :string
#
FactoryBot.define do
  factory :product do
    title { 'My product' }
    description { 'This Is My product' }
    price { rand(1..100) }
    sale_price { rand(1..100) }
    currency { '$' }
  end
end
