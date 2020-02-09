Rails.application.routes.draw do
  get "tommorow_forecast", to: "forecasts#tomorrow_forecast"
  get "past", to: "observed_weathers#past"
end
