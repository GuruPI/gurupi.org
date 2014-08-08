source 'http://rubygems.org'

gem 'bundler'
# gem 'rake', '0.9.2'
gem 'rails', '4.0.7'
gem 'heroku'
gem 'omniauth', '~> 1.0'
gem 'omniauth-facebook'
gem 'omniauth-github'
gem 'declarative_authorization'
gem 'jquery-rails'
gem 'rdiscount'
gem 'yaml_db'
gem 'draper'

group :development do
  gem 'capistrano'
  gem 'debugger'
end

gem 'pg', :group => :production
gem 'sqlite3', :group => [:test, :development]

group :test do
  gem 'rspec-rails', '~> 2.4'
  gem 'capybara'
  gem 'launchy'
  gem 'machinist', '>= 2.0.0.beta2'
  gem 'database_cleaner'
  gem 'guard'
  gem 'guard-rspec'
end

group :development, :test do
  gem 'pry'
end
