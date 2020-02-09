class AddObservedWeatherIdToRequester < ActiveRecord::Migration[5.2]
  def change
    add_column :requesters, :observed_weather_id, :integer
  end
end
