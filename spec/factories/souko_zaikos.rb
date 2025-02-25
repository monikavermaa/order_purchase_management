FactoryBot.define do
  factory :souko_zaiko do
    warehouse_code { %w[EAST WEST].sample }
    sku_code { Faker::Alphanumeric.alphanumeric(number: 8).upcase }
    stock_type { %w[01 02].sample }
    stock { Faker::Number.between(from: 1, to: 100) }
    association :prefecture_code, factory: :prefecture_code
    created_at { Time.current }
    updated_at { Time.current }
  end
end
