FactoryBot.define do
  factory :client do
    client_name { '株式会社東京' }
    postcode { '123-4567' }
    prefecture_id { 2 }
    city { '東京区' }
    block { '1-1' }
    building { '東京ハイツ' }
    phone { 11111111111 }
    pic { '山田陸太郎' }
    association :user
  end
end
