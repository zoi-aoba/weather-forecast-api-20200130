class AddYearMonthDayHourTemperatureWeatherToForecast < ActiveRecord::Migration[5.2]
  def change
    add_column :forecasts, :year, :integer
    add_column :forecasts, :month, :integer
    add_column :forecasts, :day, :integer
    add_column :forecasts, :hour, :integer
    add_column :forecasts, :temperature, :float
    add_column :forecasts, :weather, :string
  end
end
