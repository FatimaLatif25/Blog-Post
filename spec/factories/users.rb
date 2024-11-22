FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "testuser#{n}"}
    sequence(:email) { |n| "user#{n}@example.com"}
    password {"123456"}
    password_confirmation {"123456"}
  end
end
