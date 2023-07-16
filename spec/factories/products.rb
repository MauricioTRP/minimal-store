require 'faker'

FactoryBot.define do
  factory :product do
    title { Faker::Commerce.product_name }
    description { Faker::Lorem.paragraphs(number: 10).join(', ') }
    price { "9.99" }
  end
end
