class AddForecastIdToRequester < ActiveRecord::Migration[5.2]
  def change
    add_column :requesters, :forecast_id, :integer
  end
end
