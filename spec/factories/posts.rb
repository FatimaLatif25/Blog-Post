FactoryBot.define do
  factory :post do
    sequence(:title) { |n| "Some sample title #{n}"}
    content { Faker::Lorem.paragraph }
    association :user
  end
end
