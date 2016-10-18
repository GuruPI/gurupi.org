workers Integer(ENV['WEB_CONCURRENCY'] || 2)
threads_count = Integer(ENV['RAILS_MAX_THREADS'] || 5)
threads threads_count, threads_count
worker_timeout Integer(ENV['WORK_TIMEOUT'] || 1200)

preload_app!

rackup      DefaultRackup
port        (ENV['PORT'] || 5000)
environment (ENV['RACK_ENV'] || 'development')

on_worker_boot do
  ActiveRecord::Base.establish_connection
end
