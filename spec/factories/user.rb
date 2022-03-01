FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "user-#{n}" }
    sequence(:email) { |n| "test#{n}@test.com" }
    password { 'password' }
    password_confirmation { 'password' }
    role { 0 }                              # enum role: { general: 0, admin: 1 }

    trait :admin do
      role { 1 }
    end
  end
end
