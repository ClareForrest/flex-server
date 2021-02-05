FactoryBot.define do
  factory :address do
    association :user
    street {"street"}
    suburb {"suburb"}
    state {"state"}
    postcode { 3000 }
  end
end