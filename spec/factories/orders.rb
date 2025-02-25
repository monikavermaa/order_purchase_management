FactoryBot.define do
  factory :order do
    sequence(:order_number) { |n| "ORD#{1000 + n}" }
    total_amount { Faker::Commerce.price(range: 10.0..1000.0, as_string: false) }
    delivery_zipcode { Faker::Address.zip_code }
    delivery_state { Faker::Address.state }
    delivery_city { Faker::Address.city }
    delivery_area { Faker::Address.community }
    delivery_address { Faker::Address.street_address }
    tax { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    association :user
    created_at { Time.current }
    updated_at { Time.current }
  end
end