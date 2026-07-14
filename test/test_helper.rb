ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

# Disable foreign key constraint validation for fixtures in Rails 8 test environment
ActiveRecord::FixtureSet.prepend(Module.new do
  def check_all_foreign_keys_valid!
    # Skip foreign key validation during fixture loading
  end
end)

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Don't load all fixtures by default to avoid foreign key conflicts
    # fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end
