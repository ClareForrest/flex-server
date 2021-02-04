FactoryBot.define do
  factory :user do
    sequence :first_name do |n|
      "User #{n}"
    end
    last_name { "LastName" }
    email { "Email" }
    password_digest { 1 }
    phone_number { 1 }
  end
end
