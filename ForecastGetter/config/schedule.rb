require File.expand_path(File.dirname(__FILE__) + "/environment")
set :output, 'log/cron.log'

every 1.minute do
  command "rake forecast_getter:run"
  command "ls"
end