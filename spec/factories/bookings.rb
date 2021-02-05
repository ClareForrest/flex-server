FactoryBot.define do
  factory :booking do
    association :user
    association :service
    sequence :location do |n|
      "Location no. #{n}"
    end
    sequence :date do |n|
      "Jan #{n}"
    end
    time { "12:00" } 
  end
end