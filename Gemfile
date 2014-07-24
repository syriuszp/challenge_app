source 'https://rubygems.org'

# core
gem 'rails', '4.1.1'
gem 'devise'

group :production do
  gem 'pg'
  gem 'rails_12factor'
  gem 'newrelic_rpm'
end


# frontend
gem 'slim-rails'
gem 'bootstrap-sass', '~> 3.2.0'
gem 'autoprefixer-rails'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'

# doc
gem 'sdoc', '~> 0.4.0',          group: :doc

# testing and development

gem "bullet", :group => "development"
gem "rails_best_practices", :group => "development"
gem "codeclimate-test-reporter", group: :test, require: nil

group :test , :development do
  gem 'sqlite3'
  gem "database_cleaner",   "~> 1.2.0"
  gem "capybara",           github: "jnicklas/capybara" # master until rspec3 fixes are released #~> 2.2.0"
  gem "poltergeist",        "~> 1.5.0"
  gem "factory_girl_rails", "~> 4.2.0"
  gem "cucumber-rails",     "~> 1.4.1", require: false
  gem "factory_girl"
  gem "rspec-rails"
  gem "launchy"
  gem 'guard-rspec', require: false
  gem 'spring-commands-rspec'
  gem 'spring'
  gem 'rspec-collection_matchers'
end

