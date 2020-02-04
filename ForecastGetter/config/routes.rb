Rails.application.routes.draw do
  get "index", to: "forecasts#index"
  get "today_forecast", to: "forecasts#today_forecast"
  get "get_forecast", to: "forecast#get_forecast"
end
