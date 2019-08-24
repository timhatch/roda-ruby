require 'rack/unreloader'
Unreloader = Rack::Unreloader.new { App }

require 'roda'
Unreloader.require('./app.rb') { 'App' } # Not clear why { 'App' } is needed
run Unreloader
