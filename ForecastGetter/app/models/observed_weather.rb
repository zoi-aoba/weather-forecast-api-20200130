class ObservedWeather < ApplicationRecord
  validates :highest_temperature, presence: true, numericality: true
  validates :lowest_temperature, presence: true, numericality: true
  validates :weather, presence: true
  validates :date, presence: true
end
