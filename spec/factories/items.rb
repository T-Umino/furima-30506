FactoryBot.define do
  factory :item do
    name                { Faker::Lorem.word }
    description         { Faker::Lorem.sentence }
    category_id         { Faker::Number.between(from: 1, to: 10) }
    condition_id        { Faker::Number.between(from: 1, to: 6) }
    duration_id         { Faker::Number.between(from: 1, to: 3) }
    shipping_fee_id     { Faker::Number.between(from: 1, to: 2) }
    prefecture_id       { Faker::Number.between(from: 1, to: 47) }
    association :user
    price { Faker::Number.between(from: 300, to: 9_999_999) }
  end
end
