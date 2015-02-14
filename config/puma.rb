workers 2
threads_count = 1
threads threads_count, threads_count

preload_app!

#port        ENV['PORT']     || 3000
environment ENV['RACK_ENV'] || 'production'

bind 'unix:///home/arpel/Thingspeak/thingspeak/tmp/sockets/unicorn.sock'
stdout_redirect 'log/puma.log', 'log/puma_error.log', true
daemonize true

pidfile '/home/arpel/Thingspeak/thingspeak/tmp/pids/unicorn.pid'

on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end

