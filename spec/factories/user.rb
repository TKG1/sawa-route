FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "user-#{n}" }
    sequence(:email) { |n| "test#{n}@test.com" }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
