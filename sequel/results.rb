require 'sequel'
require 'pg'

# Base module declaration, instantiates a connection to a Postgresql database
#
# Instantiate database access
@db = Sequel.connect('postgres://timhatch@localhost:5432/andromeda')

@db.extension    :pg_array, :pg_json # Needed to insert arrays

Sequel.extension :pg_array_ops # Needed to query stored arrays
Sequel.extension :pg_json_ops # Needed to query stored arrays

class Climber < Sequel::Model(:climbers)
  one_to_many :results, key: :per_id # Note that a one-many association uses the plural model name
end

class Result < Sequel::Model(:results)
  many_to_one :climber, key: :per_id # , select: %i[lastname firstname nation]

  dataset_module do
    select :person, :per_id, :result_jsonb, :rank_prev_heat

    # route - fetch a collection of models from the database
    # sig { params(wet_id: Integer, grp_id: Integer, route: Integer).returns(Sequel::Dataset) }
    def route(wet_id:, grp_id:, route:)
      person
        .where(wet_id: wet_id, grp_id: grp_id, route: route)
    end
  end

  # merge_result - merge a one or more results into a model instance
  # TODO: Do we really need to create a jsonb op for each call
  # sig { params(hash: Hash).void }
  def merge_result(hash)
    jsonb = Sequel.pg_jsonb_op(:result_jsonb)
    update(result_jsonb: jsonb.concat(hash))
  end

  def to_hash
    super.merge(climber.to_hash.slice(:firstname, :lastname, :nation))
  end
end
