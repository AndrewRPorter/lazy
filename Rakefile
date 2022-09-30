# frozen_string_literal: true

require 'rake/testtask'

task default: 'test'

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:test)
# "We recommend you wrap this in a rescue clause so that you can
# use your Rakefile in an environment where RSpec is unavailable
# (for example on a production server)."
rescue LoadError
end
