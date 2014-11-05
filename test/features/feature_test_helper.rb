require_relative "../test_helper"
require 'sinatra'
require 'capybara'
require_relative '../../lib/app.rb'

Capybara.app = TwoFistedApp

class FeatureTest < Minitest::Test
  include Capybara::DSL

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
    File.delete(File.expand_path('~/Documents/Turing/projects/clonewars/test.db'))
  end
end

class Capybara::Session
  def has_submit_button?(value)
    self.has_selector?("input[type=submit][value='#{value}']")
  end
end
