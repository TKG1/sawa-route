FactoryBot.define do
  factory :mountain do
    sequence(:name) { |n| "mountain-#{n}" }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/mountain.png')) }
    prefecture
  end
end
