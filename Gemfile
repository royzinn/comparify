source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~>4.0.0'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'haml-rails'
gem 'bootstrap-sass', '~> 3.0.3.0'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :test, :development do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'fabrication'
  gem 'faker'
  gem 'pry'
  gem 'launchy'
end

group :development do
  gem "better_errors"
  gem "binding_of_caller"
  gem 'meta_request'
  gem "letter_opener", :git => "git://github.com/ryanb/letter_opener.git", :branch => "master"
end

group :test do
  gem "shoulda-matchers"
  gem 'capybara'
  gem 'capybara-email'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

ruby "2.0.0"
