Rails.application.routes.draw do
  get 'tommorow_forecast', to: 'forecasts#render_tomorrow_forecast'
  get 'get_observed_weather', to: 'observed_weathers#render_observed_weather'
end
