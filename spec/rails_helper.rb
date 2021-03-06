# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'

require 'coveralls'
Coveralls.wear!

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'action_cable/testing/rspec'
require 'pry-rails'
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'

Dir['./spec/fie/*_spec.rb'].each {|file| require file }
Dir['./spec/support/*.rb'].each {|file| require file }
Dir['./spec/test_controllers/*.rb'].each {|file| require file }
Dir['./spec/test_models/*.rb'].each {|file| require file }

RSpec.configure do |config|
  config.include HelperMethods

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, :type => :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end
