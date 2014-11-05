require_relative "../test_helper"
require 'sinatra'
require 'capybara'
require_relative '../../lib/app.rb'

Capybara.app = TwoFistedApp

class FeatureTest < Minitest::Test
  include Capybara::DSL

  def setup
    # File.delete(File.expand_path("../../test.db"))
  end

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end

class Capybara::Session
  def has_submit_button?(value)
    self.has_selector?("input[type=submit][value='#{value}']")
  end
end
