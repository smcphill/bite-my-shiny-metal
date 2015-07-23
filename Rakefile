require "rspec/core/rake_task"
require 'rubocop/rake_task'

RSpec::Core::RakeTask.new(:spec) do |task|
  task.rspec_opts = ['--color', '--order', 'rand']
end

RuboCop::RakeTask.new(:rubocop) do |task|
  task.patterns = ['lib/**/*.rb', 'spec/**/*spec.rb']
end

task prep: [:spec, :rubocop]

task default: :prep
