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
                      .each { |x| p x }


