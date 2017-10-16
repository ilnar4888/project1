ENV["RAILS_ENV"] ||= "test"

require "spec_helper"
require File.expand_path("../../config/environment", __FILE__)
require "rspec/rails"
require "shoulda/matchers"
require "capybara/rspec"
require "pundit/rspec"

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  config.include Warden::Test::Helpers

  config.after(:suite) do
    FileUtils.rm_rf(Dir["#{Rails.root}/public/testing"]) if Rails.env.test?
  end
end
