FactoryBot.define do
  factory :employee do
    association :user
    availability { "availability" }

    trait :invalid do
      availability { nil }
    end

    trait :update do
      availability { "newAvailability" }
    end
  end
end
