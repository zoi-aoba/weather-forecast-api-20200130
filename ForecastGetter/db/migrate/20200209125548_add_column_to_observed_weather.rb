class AddColumnToObservedWeather < ActiveRecord::Migration[5.2]
  def change
    add_column :observed_weathers, :weather, :string
    add_column :observed_weathers, :date, :datetime
    add_column :observed_weathers, :highest_temperature, :float
    add_column :observed_weathers, :lowest_temperature, :float
  end
end
