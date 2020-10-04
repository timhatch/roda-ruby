# routing for /data
require_relative '../graphql/schema'

class App
  hash_branch 'gql' do |r|
    r.get do
      Person
        .all
        .map(&:values) # { |x| x.values }
        .to_json
    end

    # Example httpie param: query='{ person(id: 2) { per_id firstname }}'
    # Example httpie param: query='mutation { editPerson(id:21) { success errors } }'
    r.post do
      AppSchema
        .execute(r.params[:query], variables: r.params[:variables])
        .to_json
    end
  end
end
