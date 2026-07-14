# Disable foreign key constraint validation for fixtures in Rails 8 test environment
if Rails.env.test?
  ActiveRecord::FixtureSet.prepend(Module.new do
    def check_all_foreign_keys_valid!
      # Skip foreign key validation during fixture loading
    end
  end)
end
