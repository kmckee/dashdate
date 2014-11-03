require "bundler/gem_tasks"

require 'rspec/core/rake_task'
require 'cucumber'
require 'cucumber/rake/task'

RSpec::Core::RakeTask.new(:spec)

Cucumber::Rake::Task.new(:cucumber) do |t|
  t.cucumber_opts = "features --format pretty"
end 

desc 'Run all specs and cukes'
task :test => ['spec', 'cucumber']

task :default => :test
