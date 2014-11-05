ENV['RACK_ENV'] = 'test'

require 'minitest/autorun'
require 'minitest/pride'

Minitest.after_run {
  test_db = File.expand_path(File.join(File.dirname(__FILE__), "../test.db"))
  File.delete(test_db)
}
