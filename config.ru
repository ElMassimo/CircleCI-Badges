require 'rubygems'
require 'sinatra'

RACK_ENV = ENV['RACK_ENV'] ||= "development" unless defined? RACK_ENV

def root_path(*args)
  File.join(Sinatra::Application.root, *args)
end

if RACK_ENV == 'development'
  require 'sinatra/reloader'
  also_reload root_path('app', '*')
end

require './app'

run SinatraBadges
