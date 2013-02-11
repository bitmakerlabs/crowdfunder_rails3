ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting

  # We don't use fixtures in this project. Instead we use Factories
  #fixtures :all 

  # Add more helper methods to be used by all tests here...
end

DatabaseCleaner.strategy = :truncation

class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL

  Capybara.app = Crowdfunder::Application
  Capybara.javascript_driver = :webkit

  self.use_transactional_fixtures = false 

  teardown do
  	DatabaseCleaner.clean       # Truncate the database
    Capybara.reset_sessions!    # Forget the (simulated) browser state
    Capybara.use_default_driver # Revert Capybara.current_driver to Capybara.default_driver
  end

  # This helper method can be called at the beginning of any test that required a logged in user.
  def setup_signed_in_user
  	pass = "this-is-a-password"
  	user = FactoryGirl.create :user, password: pass
  	visit '/session/new'

  	fill_in "email", with: user.email
  	fill_in "password", with: pass
  	click_button "Login"

  	# No asserts here since we are not TESTING login here, leave that to the user flow tests
  end

end