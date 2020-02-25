require File.expand_path(File.dirname(__FILE__) + "/environment")
set :output, 'log/cron.log'

rails_env = :development
set :environment, rails_env

every 1.minute do
  rake "root:run"
end