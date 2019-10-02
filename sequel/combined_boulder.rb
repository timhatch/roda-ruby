require 'ranker'

require_relative 'results'
require_relative 'boulder_modus'

class CombinedBoulderResults < Results
  def self.route(wet_id:, grp_id:, route:)
    super(wet_id: wet_id, grp_id: grp_id, route: route)
      .select_append(&Perseus::StandardBoulderModus.method(:base_rank))
      .select_append(&Perseus::StandardBoulderModus.method(:tie_break))
      .yield_self(&method(:ranking))
      .flatten
  end

  def self.ranking(results)
    data  = results.map(&:to_hash)
    order = ->(h) { [h[:base_rank], h[:tie_break], h[:rank_prev_heat]] }

    Ranker.rank(data, asc: false, strategy: :standard_competition, by: order)
          .map { |x| x.rankables.map { |r| r.merge(result_rank: x.rank) } }
  end
end

# Test output
CombinedBoulderResults.route(wet_id: 1, grp_id: 5, route: 2)
#                      .each { |x| p x }

# Create a JSONB Operation object for the "data" jsonb column in our table
jsonb = Sequel.pg_jsonb_op(:result_jsonb)

# dataset = @db[:results].where(wet_id: 1, route: 2, per_id: 5090)
route = CombinedBoulderResults.where(wet_id: 1, route: 2, grp_id: 5)
dataset = route[per_id: 5090]

hash = { p1: { a: 3, b: 2, t: 0 }, p2: { a: 3, b: 4, t: nil } }
dataset.update(result_jsonb: jsonb.concat(hash))

# p dataset[:result_jsonb]
