namespace :forecast_getter do
  task run: [:environment] do
    Requester.run
  end

  task past: [:environment] do
    Requester.past
  end
end
