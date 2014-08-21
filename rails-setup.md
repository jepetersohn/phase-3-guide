#Creating a New Rails App

## Choose your version

You may use Rails 3.2 or Rail 4.x for your rails projects.  In either you should use the options to remove Test Unit (because we will test with Rspec) and set the database to postgresql

To create a new Rails 3.2 project

  * `gem install rails 3.2.18` if you haven't already
  * `rails \_3.2.18\_ new PROJECT_NAME -T -d=postgresql`

To create a new Rails 4.x

 * `rails new PROJECT_NAME -T -d=postgresql`

## Configure the database

For working on the DBC machines, your `database.yml` file needs to have no `:username` set - so remove the default that rails provides.

```
#database.yml sample
default: &default
  adapter: postgresql
  encoding: unicode
  pool: 5

development:
  <<: *default
  database: strava-with-friends_development
test:
  <<: *default
  database: strava-with-friends_test
production:
  <<: *default
  database: strava-with-friends_production
  username: #Set these when you deploy
  password:

```

## Setup for testing

Your Gemfile should include the following gems:
```ruby
group :development, :test do
  gem 'rspec-rails', '~>2.14'
  gem 'factory_girl_rails'
  gem 'faker'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'database_cleaner'
  gem 'shoulda-matchers'
end
```

**Note:** rspec is currently at version 3.0.* which was a breaking update.  If you are starting a new Rails 4.* project you will probably want to work with rspec 3.0 do not set the version in the gem file (`gem 'rspec-rails'`)  If you are working on a Rails 3.* project - be sure to set the version in the gemfile (`gem 'rspec-rails', '~>2.14'`). See [this blog](http://myronmars.to/n/dev-blog/2014/06/rspec-2-99-0-and-3-0-0-have-been-released) for more detials on which version of rspec you want to use and upgrade issues.

Run

* `bundle`
* `rails generate rspec:install`

This will load your gems and create a `spec` folder and `spec/spec_helper.rb` file.

Add the configuration for database cleaner so your `spec_helper.rb` file looks like this:

```ruby
# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = false

  config.infer_base_class_for_anonymous_controllers = false

  config.order = "random"

#Add these lines for database cleaner
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end
```
### Start it up

Run `rake db:create` or `bundle exec rake db:create` to create your database

Start your web server `rails server`
