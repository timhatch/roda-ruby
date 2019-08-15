require 'roda'
require 'json'

# SImple test class
class App < Roda
  # Allows before do actions
  plugin :hooks

  before do
    request.params.transform_keys!(&:to_sym)
  end

  route do |r|
    r.on 'data' do
      r.get do
        p r.params
        r.params.to_json
      end

      r.post do
        p r.params
        r.params.to_json
      end
    end
  end
end

run App

# def func
#   p 'test method'
# end
# r.on 'lamb', &proc
# r.on 'func', &method(:func)
# r.root { 'hello' }
