set :output, "log/cron_log.log"

every 5.minutes do
  rake "bus_travel:lookup"
end
