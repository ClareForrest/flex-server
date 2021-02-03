FactoryBot.define do
  factory :booking do
    sequence :location do |n|
      "Location no. #{n}"
    end
    sequence :date do |d|
      "Jan #{d}"
    end
    time { "MyString" }
    user_id { 1 }
    service_id { 1 }
  end
end