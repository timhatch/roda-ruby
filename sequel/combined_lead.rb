require 'ranker'

require_relative 'result'
require_relative 'lead_modus'

class CombinedLeadResult < Result
  # route - fetch a collection of models and add ranking data to each
  # sig { params(wet_id: Integer, grp_id: Integer, route: Integer).returns(T::Array[Hash]) }
  def self.route(wet_id:, grp_id:, route:)
    super(wet_id: wet_id, grp_id: grp_id, route: route)
      .map(&:to_hash).map { |x| x.merge(points: []) }
      .yield_self(&Perseus::StandardLeadModus.method(:add_rank))
      .yield_self(&Perseus::StandardLeadModus.method(:add_time))
      .yield_self(&method(:ranking))
  end

  # ranking - calculate a result_rank for each model in the dataset
  # ranking order is result? -> height -> time -> countback
  # sig { params(results: T:Array[Hash]).returns(T::Array[Hash]) }
  def self.ranking(results)
    order = lambda do |h|
      [result?(h), h[:points].reduce(:*), h[:time], h[:rank_prev_heat] || 0]
    end

    # TODO: Consider (result_rank: nil if result_jsonb.empty?), i.e. where a competitor
    # has not started
    Ranker.rank(results, asc: false, strategy: :standard_competition, by: order)
          .flat_map { |x| x.rankables.map { |r| r.merge(result_rank: x.rank) } }
  end
end

# Test output
CombinedLeadResult.route(wet_id: 10, grp_id: 45, route: 1)
                  .each { |x| p x }
