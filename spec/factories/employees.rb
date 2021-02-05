FactoryBot.define do
  factory :employee do
    association :user
    availability { "availability" }

    trait :invalid do
      availability { nil }
    end
  end
end
