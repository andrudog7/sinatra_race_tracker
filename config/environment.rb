require 'bundler/setup'
Bundler.require
#(:default, ENV['SINATRA_ENV'])
require_all 'app'

configure :development do 
  ENV['SINATRA_ENV'] ||= "development"

    ActiveRecord::Base.establish_connection(
      ENV['SINATRA_ENV'].to_sym
      )
end 

configure :production do 
  ENV['SINATRA_ENV'] ||= "production"
  ActiveRecord::Base.establish_connection(
    ENV['SINATRA_ENV'].to_sym
    )
end 

require './app/controllers/application_controller'
