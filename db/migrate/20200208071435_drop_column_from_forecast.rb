class DropColumnFromForecast < ActiveRecord::Migration[5.2]
  def change
    remove_column :forecasts, :year, :integer
    remove_column :forecasts, :month, :integer
    remove_column :forecasts, :day, :integer
    remove_column :forecasts, :hour, :integer
  end
end
