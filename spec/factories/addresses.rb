FactoryBot.define do
  factory :address do
    postal_code         { '000-0000' }
    prefecture_id       { Faker::Number.between(from: 1, to: 47) }
    municipality        { Faker::Lorem.words(number: 1) }
    details             { Faker::Lorem.characters(number: 10) }
    building_name       { Faker::Lorem.characters(number: 10) }
    tel                 { Faker::Number.number(digits: 11) }
    association :purchase
  end
end
