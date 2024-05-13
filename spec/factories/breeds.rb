FactoryBot.define do
  factory :breed do
    sequence(:name) { |n| "Breed #{n}" }
    image_url { Faker::LoremFlickr.image(search_terms: ['dog']) }
  end
end