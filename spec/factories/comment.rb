FactoryBot.define do
  factory :comment do
    text { 'test' }
    user
    route
  end
end
