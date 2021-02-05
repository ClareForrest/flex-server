FactoryBot.define do
  factory :user do
    sequence :first_name do |n|
      "User #{n}"
    end
    last_name { "LastName" }
    sequence :email do |n|
      "testUser#{n}@test.com"
    end
    password { "123456" }
    sequence :phone_number do |n|
      "#{n}"
    end
  end
end
