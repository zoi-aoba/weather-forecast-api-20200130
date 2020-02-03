namespace :forecast_getter do
  task run: [:environment] do
    Requester.run
  end
end
