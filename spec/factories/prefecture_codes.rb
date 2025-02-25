FactoryBot.define do
  factory :prefecture_code do
    name { Faker::Address.state }
    code { Faker::Number.number(digits: 2).to_s }
    ew_flag { %w[EAST WEST].sample }
    created_at { Time.current }
    updated_at { Time.current }
  end
end
