require 'roda'
require 'json'

# SImple test class
class App < Roda
  SOME_CONSTANT = 22

  plugin :hooks       # Allows before-do actions, ALTERNATIVE is :roda-symbolized-params
  plugin :hash_routes # Use routes in separate files

  Dir['./routes/*.rb'].each { |f| require f }

  # Convert params keys to symbols
  before do
    request.params.transform_keys!(&:to_sym)
  end

  route(&:hash_routes)
end

run App

# def func
#   p 'test method'
# end
# r.on 'lamb', &proc
# r.on 'func', &method(:func)
# r.root { 'hello' }
