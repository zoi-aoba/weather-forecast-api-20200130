FactoryBot.define do
  factory :forecast do
    year { 2020 }
    month { 2 }
    day { 5 }
    hour { 18 }
    temperature { 3.8 }
    weather { "Cloud" }
  end
end
