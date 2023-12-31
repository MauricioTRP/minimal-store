FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test-#{n.to_s.rjust(3,'0')}@example.com"}
    password { "123456" }
    name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    phone { '985214786' }
    rut { Faker::ChileRut.full_rut }
  end
end
