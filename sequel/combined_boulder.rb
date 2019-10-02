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

# dataset = @db[:results].where(wet_id: 1, route: 2, per_id: 5090)
dataset = CombinedBoulderResults.where(wet_id: 1, route: 2, grp_id: 5)[per_id: 5090]
hash    = { p1: { a: 3, b: 2, t: 3 }, p2: { a: 3, b: 4, t: nil } }
dataset.merge_result(hash)

# Test output
CombinedBoulderResults.route(wet_id: 1, grp_id: 5, route: 2)
                      .each { |x| p x }
