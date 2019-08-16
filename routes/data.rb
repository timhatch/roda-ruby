# routing for /data
class App
  hash_branch 'data' do |r|
    r.get do
      p "GET #{SOME_CONSTANT}"
      p r.params
      r.params.to_json
    end

    r.post do
      p "POST #{SOME_CONSTANT}"
      p r.params
      r.params.to_json
    end
  end
end
