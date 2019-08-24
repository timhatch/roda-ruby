#!/usr/local/bin/ruby

require 'httparty'

# post :: (a) -> (b)
# sig { params(Hash).returns(HTTParty::Response) }
# Test handling of a POST message
def post(payload)
  type = { 'Content-Type' => 'application/json' }
  HTTParty.post('http://localhost:9292/data', body: { data: payload }, options: { headers: type })
end

# Test data
post(wet_id: 111, per_id: 1030, result: { p1: { a: 1, z: 1, t: 1 } })
  .tap { |r| p r.class }
  .tap { |r| p r.response }
  .tap { |r| p r.headers }
  .tap { |r| p r.body }            # The response body (a serialized JSON object)
  .tap { |r| p r.parsed_response } # The response body parsed as a Hash
