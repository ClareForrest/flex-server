FactoryBot.define do
  factory :user do
    sequence :first_name do |n|
      "User #{n}"
    end
    last_name { "LastName" }
    email { "Email" }
    sequence :password_digest do |pw|
      "Password: #{pw}"
    end
    sequence :phone_number do |ph|
      "Phone Number: #{ph}"
    end
  end
end
