require 'simplecov'
SimpleCov.start

require "bundler/setup"
require "spty"
require 'byebug'

dir = File.dirname(__FILE__)
require "#{dir}/support/command_runner_helper"
require "#{dir}/shared_examples/player_not_running_shared_example"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  # Include command runner helper
  config.include CommandRunnerHelper

  # Stub the STDOUT so we can test the output and not have it write to terminal
  config.before(:each) do
    $stdout = StringIO.new
  end

  # Return back STDOUT once test is done
  config.after(:all) do
    $stdout = STDOUT
  end
end
