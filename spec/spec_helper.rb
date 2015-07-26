require 'simplecov'

RSpec.configure do |config|
  config.mock_with :rspec do |mocks|
    mocks.verify_doubled_constant_names = true
  end
end

SimpleCov.start do
  coverage_dir 'tmp/coverage'
  add_filter ['/.bundle/', '/.git/', '/spec/', '/bin/', '/config/']
  SimpleCov.minimum_coverage 100
end if ENV['COVERAGE']

$LOAD_PATH.unshift File.expand_path('../../toy_robot', __FILE__)
require 'toy_robot'
