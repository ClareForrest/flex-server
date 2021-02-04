FactoryBot.define do
  factory :booking do
    association :user
    association :service
    sequence :location do |n|
      "Location no. #{n}"
    end
    sequence :date do |d|
      "Jan #{d}"
    end
    time { "MyString" }
  end
end