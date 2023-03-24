FactoryBot.define do
  factory :sale do
    part_id { 1 }
    shipping_day {2023-03-23}
    sale_quantity {1}
    association :user
    association :part
  end
end
