source 'https://rubygems.org'

ruby '2.4.0'

gem 'rails', '~> 5.0.1'

gem 'dotenv-rails', groups: [:development, :test]

gem 'omniauth-twitter'
gem 'thin'
gem 'sass-rails'
gem 'uglifier'
gem 'bootstrap-sass'
gem 'ember-cli-rails'
gem 'active_model_serializers'
gem 'responders'
gem 'jsonapi-resources'

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'poltergeist', require: false
  gem 'selenium-webdriver', require: false
  gem 'database_cleaner'
  gem 'awesome_print'
end

group :test do
  gem 'factory_girl_rails'
end

group :production do
  gem 'pg'
end
