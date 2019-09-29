# Module  Perseus                 - The namespace for all application code
# Module  LocalDBConnection       - Helper methods to access the LAN database
#                                   LocalDBConnection methods are broken into a series of
#                                   sub-modules.
#                                   1) Competitors - Adding/editing/deleting competitors
#                                   2) Competition - Adding/editing/deleting competitions
#                                   3) Results     - Adding/editing/deleting results
#                                   4) Session     - Editing Session data
#                                   5) Startlist   - Adding/editing/deleting startlists
#
require 'sequel'
require 'pg'

require_relative 'boulder_modus'

# Base module declaration, instantiates a connection to a Postgresql database
#
# Instantiate database access
@db = Sequel.connect('postgres://timhatch@localhost:5432/roda_test')

@db.extension    :pg_array, :pg_json # Needed to insert arrays

Sequel.extension :pg_array_ops # Needed to query stored arrays
Sequel.extension :pg_json_ops # Needed to query stored arrays

class Results < Sequel::Model
  dataset_module do
    select :person, :per_id, :sort_values, :rank_prev_heat, :result_jsonb
    order  :by_rank, Sequel.asc(:result_rank)

    def for(wet_id:, grp_id:, route:)
      person
        .select_append(&method(:standard_rank))
        .by_rank
        .where(wet_id: wet_id, grp_id: grp_id, route: route)
        .all
    end

    def standard_rank
      Sequel.function(:rank).over(
        partition: %i[wet_id grp_id route],
        order: rank_generator
      ).as(:result_rank)
    end

    def rank_generator
      Perseus::CombinedBoulderModus.rank_generator
    end

    def change
      Sequel.function(:rank).over(
        partition: %i[wet_id grp_id route],
        order: Sequel.desc(:temp_rank)
      ).as(:countback_order)
    end
  end
end

require 'matrix'
Results.for(wet_id: 1, grp_id: 5, route: 2).each { |x| p x.to_hash }
