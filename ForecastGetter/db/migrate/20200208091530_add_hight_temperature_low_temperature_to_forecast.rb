class AddHightTemperatureLowTemperatureToForecast < ActiveRecord::Migration[5.2]
  def change
    add_column :forecasts, :hightest_temperature, :float
    add_column :forecasts, :lowest_temperature, :float
    remove_column :forecasts, :temperature, :float
  end
end
