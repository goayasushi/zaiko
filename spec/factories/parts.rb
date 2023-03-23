FactoryBot.define do
  factory :part do
    part_name {Faker::Lorem.word}
    client_id { 1 }
    purchase_price {Faker::Number.between(from: 1, to: 9999999)}
    selling_price {Faker::Number.between(from: 1, to: 9999999)}
    association :user
    association :client
  end
end
