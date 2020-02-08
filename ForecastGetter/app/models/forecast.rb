class Forecast < ApplicationRecord
  validates :year, presence: true, numericality: {only_integer: true}
  validates :month, presence: true, numericality: {only_integer: true}, inclusion: { in: (1..12)}
  validates :day, presence: true, numericality: {only_integer: true}, inclusion: { in: (1..100)}
  validates :hour, presence: true, numericality: {only_integer: true}
  validates :temperature, presence: true, numericality: true
  validates :weather, presence: true
end
