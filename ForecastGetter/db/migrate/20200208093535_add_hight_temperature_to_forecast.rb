class AddHightTemperatureToForecast < ActiveRecord::Migration[5.2]
  def change
    remove_column :forecasts, :hightest_temperature, :float
    add_column :forecasts, :highest_temperature, :float
  end
end
