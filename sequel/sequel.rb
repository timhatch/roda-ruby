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

class Results < Sequel::Model
  # rubocop:disable Metrics/BlockLength
  dataset_module do
    select :person, :per_id, :rank_prev_heat, :result_jsonb

    def for(wet_id:, grp_id:, route:)
      person
        .where(wet_id: wet_id, grp_id: grp_id, route: route)
        .select_append(&method(:base_rank))
        .select_append(&method(:tie_break))
        .yield_self(&method(:ranking))
        .flatten
    end

    def base_rank
      Sequel.function(:rank)
            .over(order: Perseus::StandardBoulderModus.results)
            .as(:base_rank)
    end

    def tie_break
      Sequel.function(:rank)
            .over(order: Perseus::StandardBoulderModus.tie_breaks)
            .as(:tie_break)
    end

    def ranking(results)
      data  = results.map(&:to_hash)
      order = ->(h) { [h[:base_rank], h[:tie_break], h[:rank_prev_heat]] }

      Ranker.rank(data, asc: false, strategy: :standard_competition, by: order)
            .map { |x| x.rankables.map { |r| r.merge(result_rank: x.rank) } }
    end
  end
  # rubocop:enable Metrics/BlockLength
end

data = Results.for(wet_id: 1, grp_id: 5, route: 2)
data.each { |x| p x }
