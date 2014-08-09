source 'http://rubygems.org'
ruby "1.9.3"

gem 'bundler'
gem 'rails', '4.0.7'
gem 'rb-readline', :require => false
gem 'heroku'
gem 'omniauth', '~> 1.0'
gem 'omniauth-facebook'
gem 'omniauth-github'
gem 'declarative_authorization'
gem 'json'
gem 'jquery-rails'
gem 'rdiscount'
gem 'yaml_db'
gem 'draper'
gem 'react-rails', '~> 0.11.1.0'

gem 'pg', :group => :production

# assets
gem 'uglifier', '>= 1.3.0'

group :development do
  gem 'thin'
  gem 'capistrano'
  gem 'debugger'
end

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
  gem 'sqlite3'
  gem 'pry'
end
