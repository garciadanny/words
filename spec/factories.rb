FactoryBot.define do
  factory :quote do
    trait :with_text do
      text { Faker::Lorem.paragraph }
    end
  end
end
