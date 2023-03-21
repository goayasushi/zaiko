FactoryBot.define do
  factory :user do
    email {Faker::Internet.free_email}
    password {Faker::Alphanumeric.alphanumeric(number: 8, min_alpha: 1, min_numeric: 1)}
    password_confirmation {password}
    last_name {'山田'}
    first_name {'メアリーじゅん'}
    last_name_kana {'ヤマダ'}
    first_name_kana {'メアリージュン'}
  end
end