require 'ranker'

require_relative 'result'
require_relative 'boulder_modus'

class CombinedBoulderResult < Result
  # route - fetch a collection of models and add ranking data to each
  # sig { params(wet_id: Integer, grp_id: Integer, route: Integer).returns(T::Array[Hash]) }
  def self.route(wet_id:, grp_id:, route:)
    super(wet_id: wet_id, grp_id: grp_id, route: route)
      .map(&:to_hash)
      .yield_self(&Perseus::StandardBoulderModus.method(:add_rank))
      .yield_self(&Perseus::StandardBoulderModus.method(:add_atts))
      .yield_self(&method(:ranking))
  end

  # ranking - calculate a result_rank for each model in the dataset
  # ranking order is result? -> T/Z/TA/ZA -> iiebreaks -> countback
  # sig { params(results: T:Array[Hash]).returns(T::Array[Hash]) }
  def self.ranking(results)
    order = lambda do |h|
      [result?(h), h.delete(:base), h.delete(:ties), h[:rank_prev_heat] || 0]
    end

    # TODO: Consider (result_rank: nil if result_jsonb.empty?), i.e. where a competitor
    # has not started
    Ranker.rank(results, asc: false, strategy: :standard_competition, by: order)
          .flat_map { |x| x.rankables.map { |r| r.merge(result_rank: x.rank) } }
  end
end

# dataset = @db[:results].where(wet_id: 1, route: 2, per_id: 5090)
# dataset = CombinedBoulderResults.where(wet_id: 1, route: 2, grp_id: 5)[per_id: 5090]
# hash    = { p1: { a: 3, b: 2, t: 3 }, p2: { a: 3, b: 4, t: nil } }
# dataset.merge_result(hash)

# Test output
CombinedBoulderResult.route(wet_id: 1, grp_id: 5, route: 2)
                     .each { |x| p x }
