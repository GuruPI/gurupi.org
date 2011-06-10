require "bundler/capistrano"
set :application, "gurupi.org"
set :repository,  "https://github.com/GuruPI/gurupi.org.git"
set :user, "gurupi"
set :deploy_to, "/home/#{user}/www/#{application}"
set :use_sudo, false
set :scm, :git
role :web, "gurupi.org"
role :app, "gurupi.org"
role :db,  "gurupi.org", :primary => true
task :after_update_code do
  run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml" 
end
namespace :init do
  desc "create database configuration"
  task :database_configuration do
    conf =<<-EOF
production:
  adapter: sqlite3
  database: #{shared_path}/production.sqlite3
  pool: 5
  timeout: 5000
EOF
    run "mkdir -p #{shared_path}/config"
    put conf, "#{shared_path}/config/database.yml"
  end
end
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
after "deploy:setup", "init:database_configuration"
