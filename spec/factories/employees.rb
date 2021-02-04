FactoryBot.define do
  factory :employee do
    association :user
    availability { "availability" }
  end
end
