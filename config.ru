$:.unshift File.expand_path("./../lib", __FILE__)

require 'bundler'
Bundler.require

require 'app'

# Sequel.connect(ENV['DATABASE_URL'] || 'postgres://localhost/mydb')

run TwoFistedApp
