FactoryBot.define do
  factory :address do
    association :user
    street {"street"}
    suburb {"suburb"}
    state {"state"}
    postcode { 3000 }

    trait :invalid do
      street { nil }
    end

    trait :update do
      street { "updatedStreet" }
    end
  end
end