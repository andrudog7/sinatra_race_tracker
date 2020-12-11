ENV['SINATRA_ENV'] ||= "production"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
  ENV['SINATRA_ENV'].to_sym
)

require './app/controllers/application_controller'
require_all 'app'
