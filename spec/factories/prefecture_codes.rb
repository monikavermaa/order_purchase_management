FactoryBot.define do
  factory :prefecture_code do
    name { "北海道" }
    code { Faker::Number.number(digits: 2).to_s }
    ew_flag { "東" }
    created_at { Time.current }
    updated_at { Time.current }
  end
end