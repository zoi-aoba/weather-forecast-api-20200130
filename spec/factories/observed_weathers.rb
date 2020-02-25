require "date"

FactoryBot.define do
  factory :observed_weather do
    date { Date.today }
    highest_temperature { 3.8 }
    lowest_temperature { 10.8 }
    weather { "Cloud" }
  end
end
