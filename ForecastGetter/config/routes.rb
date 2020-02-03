Rails.application.routes.draw do
  get "get_forecast_5days", to: "forecasts#get_forecast_5days"
end
