require "date"

FactoryBot.define do
  factory :forecast do
    date { Date.today + 1}
    highest_temperature { 3.8 }
    lowest_temperature { 10.8 }
    weather { 'Cloud'}
  end
end
