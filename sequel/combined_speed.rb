require 'ranker'

require_relative 'result'
require_relative 'speed_modus'

class CombinedSpeedResult < Result
  # route - fetch a collection of models and add ranking data to each
  # sig { params(wet_id: Integer, grp_id: Integer, route: Integer).returns(T::Array[Hash]) }
  def self.route(wet_id:, grp_id:, route:)
    super(wet_id: wet_id, grp_id: grp_id, route: route)
      .map(&:to_hash)
      .yield_self(&Perseus::StandardSpeedModus.method(:add_rank))
      .yield_self(&method(:ranking))
  end

  # ranking - calculate a result_rank for each model in the dataset
  # ranking order is result? -> height -> time -> countback
  # sig { params(results: T:Array[Hash]).returns(T::Array[Hash]) }
  def self.ranking(results)
    order = lambda do |h|
      [result?(h), h[:fraction_rank]]
    end
    # TODO: Consider (result_rank: nil if result_jsonb.empty?), i.e. where a competitor
    # has not started or has an IRM for the round
    Ranker.rank(results, asc: false, strategy: :standard_competition, by: order)
          .flat_map { |x| x.rankables.map { |r| r.merge(result_rank: x.rank) } }
  end
end

# Test output
CombinedSpeedResult.route(wet_id: 10, grp_id: 42, route: 3)
                   .each { |x| p x }
