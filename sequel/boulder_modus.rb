# Module  Perseus                 - The namespace for application code
# Module  StandardBoulderModus    - IFSCBoulderModus methods

require 'ranker'

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

    # sig ( returns(Proc).returns(T::Array[Integer)) }
    def self.ifsc1999
      ->(h) { [h[:sort_values][0], -h[:sort_values][1], h[:sort_values][2], -h[:sort_values][3]] }
    end

    # sig ( returns(Proc).returns(T::Array[Integer)) }
    def self.ifsc2018
      ->(h) { [h[:sort_values][0], h[:sort_values][2], -h[:sort_values][1], -h[:sort_values][3]] }
    end

    module_function

    # sig { params(Hash).returns(Hash) }
    def base_rank(results)
      data = results.map { |x| x.merge(sort_values: sortvalues(x[:result_jsonb])) }

      Ranker.rank(data, asc: true, strategy: :standard_competition, by: ifsc2018)
            .flat_map { |x| x.rankables.map { |r| r.merge(base_rank: x.rank) } }
    end

    # sig { params(Hash).returns(Hash) }
    def tie_break(results)
      data  = results.map { |x| x.merge(tie_breaks: tiebreaks(x[:result_jsonb])) }
      order = ->(h) { h[:tie_breaks] }

      Ranker.rank(data, asc: false, strategy: :standard_competition, by: order)
            .flat_map { |x| x.rankables.map { |r| r.merge(tie_break: x.rank) } }
      # .map { |x| x.tap { |r| r.delete(:tie_breaks) } }
    end

    # Calculate the overall result for the competitor (i.e. 1t2 3b4), storing the result in
    # an array.
    # sig { params(result_jsonb: Hash).returns(Array[Integer]) }
    # NOTE: <result_jsonb> is a hash containing the result, e.g.
    #       { p1: { a: 1, b: 1, t:1 }, p2: { a: 3, b: 3 } }
    def sortvalues(result_jsonb)
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
    def tiebreaks(result_jsonb)
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
