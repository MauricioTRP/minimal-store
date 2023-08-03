FactoryBot.define do
  factory :order do
    name { "MyString" }
    address { "MyText" }
    email { "MyString" }
    pay_type { "Check" }
  end
end
