require 'simplecov'
require 'vcr'
require 'webmock'

SimpleCov.start 'rails' do
  add_filter "/vendor/"
end

ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
  class << self
    alias :context :describe
  end
end

class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL
end

VCR.configure do |c|
  c.cassette_library_dir = 'vcr_cassettes'
  c.hook_into :webmock
  c.filter_sensitive_data('<YWSID>') { 'VR0eNW8-767FtIrg21dKAA' }
end
