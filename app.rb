require 'roda'
require 'json'

# SImple test class
class App < Roda
  SOME_CONSTANT = 22

  plugin :hooks       # Allows before-do actions, ALTERNATIVE is :roda-symbolized-params
  plugin :hash_routes # Use routes in separate files
  plugin :json        # Return responses as JSON
  plugin :json_parser # Parses request bodies as JSON where Content-Type==application/json

  Dir['./routes/*.rb'].each { |f| require f }
  Dir['./graphql/*.rb'].each { |f| require f }

  # Convert params keys to symbols
  before do
    request.params.transform_keys!(&:to_sym)
  end

  route(&:hash_routes)
end

# def func
#   p 'test method'
# end
# r.on 'lamb', &proc
# r.on 'func', &method(:func)
# r.root { 'hello' }
