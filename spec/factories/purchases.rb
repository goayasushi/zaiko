FactoryBot.define do
  factory :purchase do
    part_id { 1 }
    arrival_day {2023-03-23}
    purchase_quantity {1}
    association :user
    association :part
  end
end
