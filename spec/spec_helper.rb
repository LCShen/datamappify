require 'simplecov'
require 'pry'
require 'rspec/autorun'
require 'database_cleaner'

SimpleCov.start

SimpleCov.configure do
  add_filter "/spec/"
end

require File.expand_path('../../lib/datamappify', __FILE__)

%w{entities tables repositories}.each do |sub_dir|
  Dir[File.expand_path("../support/#{sub_dir}/**/*.rb", __FILE__)].each { |f| require f }
end

DATA_PROVIDERS = %w{ActiveRecord}

RSpec.configure do |config|
  DatabaseCleaner.strategy = :truncation

  config.before do
    DatabaseCleaner.clean
  end
end
