source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~>4.0.0'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'
gem 'haml-rails'
gem 'bootstrap-sass', '~> 3.0.3.0'
gem 'devise', '~> 3.1.1'
gem "figaro"
gem 'friendly_id', '~> 5.0.0'
gem 'bootstrap_form'
gem 'rails_autolink'
gem 'html-pipeline'
gem 'github-markdown'
gem 'sanitize'
gem 'rinku'
gem 'gemoji'
gem 'public_activity'

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
  gem 'spork-rails', '4.0.0'
  gem 'guard-spork', '1.5.0'
  gem 'childprocess', '0.3.6'
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
