require 'simplecov'
SimpleCov.start do
  coverage_dir 'tmp/coverage'
  add_filter ['/.bundle/', '/.git/', '/spec/', '/bin/', '/config/']
end

SimpleCov.minimum_coverage 100

$LOAD_PATH.unshift File.expand_path('../../toy_robot', __FILE__)
require 'toy_robot'
