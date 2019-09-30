require 'sequel'
require 'pg'
require 'ranker'

require_relative 'boulder_modus'

# Base module declaration, instantiates a connection to a Postgresql database
#
# Instantiate database access
@db = Sequel.connect('postgres://timhatch@localhost:5432/roda_test')

@db.extension    :pg_array, :pg_json # Needed to insert arrays

Sequel.extension :pg_array_ops # Needed to query stored arrays
Sequel.extension :pg_json_ops # Needed to query stored arrays

class Results < Sequel::Model(:results)
  dataset_module do
    select :person, :per_id, :firstname, :lastname, :nation, :result_jsonb, :rank_prev_heat

    def for(wet_id:, grp_id:, route:)
      person
        .join(:climbers, [:per_id])
        .where(wet_id: wet_id, grp_id: grp_id, route: route)
        .select_append(&Perseus::StandardBoulderModus.method(:base_rank))
        .select_append(&Perseus::StandardBoulderModus.method(:tie_break))
        .yield_self(&method(:ranking))
        .flatten
    end

    def ranking(results)
      data  = results.map(&:to_hash)
      order = ->(h) { [h[:base_rank], h[:tie_break], h[:rank_prev_heat]] }

      Ranker.rank(data, asc: false, strategy: :standard_competition, by: order)
            .map { |x| x.rankables.map { |r| r.merge(result_rank: x.rank) } }
    end
  end
end

data = Results.for(wet_id: 1, grp_id: 5, route: 2)
data.each { |x| p x }
