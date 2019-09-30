# Module  Perseus                 - The namespace for application code
# Module  CombinedBoulderModus    - IFSCBoulderModus methods

require 'sequel'
require 'pg'

module Perseus
  module StandardBoulderModus
    # private_class_method

    # Simple helper to calculate tops/bonuses and the relevant number of attempts
    # This function is not called if the relevant value is nil (doesn't exist), so
    # internally we just need to check for it existing but having a value of zero
    # @params
    # - An array [x, y] holding the aggregated result and
    # - A value passed in (may be zero)
    # OPTIMIZE: Refactor this as a lambda?
    def self.set_atts(array, value)
      array[0] += 1 unless value.zero?
      array[1] += value
    end

    module_function

    # sig { returns(Sequel::AliasedExpression) }
    # NOTE: Updated 18-02-2018 to use the revised scoring system for 2018
    # Sequel helper function to calculate a rank-order value sorting a boulder result by
    # tops (descending), bonuses (descending), top attempts (ascending), bonus attempts
    # (ascending). The desc(nulls: :last) postfix ensures that results with a null value
    # are ranked lower than results with a value of 0 (i.e. competitors who havenot started
    # are always ranked below competitors who have started
    # FIXME: This is fine for simple case where we use countbacks in a binary fashion, but it's
    # doesn't deal with the case where we want to apply countbacks only for podium places
    def base_rank
      rank_arr = [
        Sequel.pg_array_op(:sort_values)[1].desc(nulls: :last),
        Sequel.pg_array_op(:sort_values)[3].desc,
        Sequel.pg_array_op(:sort_values)[2],
        Sequel.pg_array_op(:sort_values)[4]
      ]

      Sequel.function(:rank).over(order: rank_arr).as(:base_rank)
    end

    # sig { returns(Sequel::AliasedExpression) }
    # TODO: Modify to deal with an arbitrary number of blocs (here assumes max = 4)
    def tie_break
      rank_arr = (1..8).map { |i| Sequel.pg_array_op(:tie_breaks)[i] }

      Sequel.function(:rank).over(order: rank_arr).as(:tie_break)
    end

    # Merge any update into the results, e.g.
    # { p1: { a: 1, b: 1, t:1 }, p2: { a: 2 } }.merge( p2: { a: 3, b: 3 })
    # becomes
    # { p1: { a: 1, b: 1, t:1 }, p2: { a: 3, b: 3 } }
    # @params
    # - A Hash containing the unmodified result
    # - A Hash containing the new result to be merged in
    # NOTE: PostGreSQL's jsonb functionality may allow this to be dispensed with.
    def merge(result, update)
      result ||= {}
      result.merge(update)
    end

    # Calculate the overall result for the competitor (i.e. 1t2 3b4), storing the result in
    # an array.
    # sig { params(result_jsonb: Hash).returns(Array[Integer]) }
    # NOTE: <result_jsonb> is a hash containing the result, e.g.
    #       { p1: { a: 1, b: 1, t:1 }, p2: { a: 3, b: 3 } }
    def update_sortvalues(result_jsonb)
      barr = [0, 0]
      tarr = [0, 0]

      unless result_jsonb.nil?
        result_jsonb.each do |_k, v|
          set_atts(barr, v['b']) unless v['b'].nil?
          set_atts(tarr, v['t']) unless v['t'].nil?
        end
      end
      tarr + barr
    end

    # sig { params(result_jsonb: Hash).returns(Array[Integer]) }
    # TODO: Modify to deal with an arbitrary number of blocs (here assumes max = 4)
    def update_tiebreaks(result_jsonb)
      barr = [0, 0, 0, 0]
      tarr = [0, 0, 0, 0]

      unless result_jsonb.nil?
        result_jsonb.each.with_index do |(_k, v), i|
          barr[i] = v['b'] || 0
          tarr[i] = v['t'] || 0
        end
      end
      tarr.sort + barr.sort
    end
  end
end
