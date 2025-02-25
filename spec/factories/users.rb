FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "password123" }
    created_at { Time.current }
    updated_at { Time.current }
  end
end