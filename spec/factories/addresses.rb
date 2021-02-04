FactoryBot.define do
  factory :address do
    association :user
    street {"street"}
    suburb {"suburb"}
    state {"state"}
    postcode {"postcode"}
  end
end