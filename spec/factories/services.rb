FactoryBot.define do
  factory :service do
    name { "name of service " }
    cost { 75 }

    trait :invalid do
      name { nil }
    end
  end
end
