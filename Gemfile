source 'http://rubygems.org'

gem 'rake', '< 11'
gem 'rdoc', '~> 4.2.2' # This is to support Ruby 1.8 and 1.9

group :development do
  # Travis simulator - faster + no more waiting for build emails
  gem 'wwtd', '~> 1.3.0'
  gem 'appraisal', '~> 2.2.0'
end

group :test do
  gem 'rspec', '~> 3.7.0'
  gem 'rspec-rails', '~> 3.6'
  gem 'capybara', '~> 2.15.4'
  gem 'activerecord-nulldb-adapter', '~> 0.3.7'
end

gemspec
