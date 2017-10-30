require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../dummy/init', __FILE__)
# Prevent database truncation if the environment is production
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
